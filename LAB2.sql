WITH test_data (number_kafedra, vipusk_kafedra, name_kafedra) AS (
    VALUES 
        (5, true, 'Высшая математика'),
        (12, true, 'Прикладная математика'),
        (15, true, 'Математика и информатика'),
        (21, true, 'Дискретная математика'),
        (34, true, 'Математический анализ'),
        (42, true, 'Математическое моделирование'),
        (55, true, 'Теория вероятностей и математическая статистика'),
        (61, true, 'Вычислительная математика'),
        (88, true, 'Математика'),
        (101, true, 'Фундаментальная математика')
)
SELECT number_kafedra
FROM test_data
WHERE vipusk_kafedra = true 
  AND name_kafedra ILIKE '%математика%';

  SELECT *
FROM prepods
WHERE number_kafedri = 15 
  AND (kontaktni_telefon IS NULL OR kontaktni_telefon = '');

DROP TABLE IF EXISTS math_kafedra_teachers;

CREATE TABLE math_kafedra_teachers AS
SELECT 
    k.number_kafedra, 
    k.name_kafedra, 
    p.familiya
FROM kafedra k
JOIN prepods p ON k.number_kafedra = p.number_kafedri
WHERE k.vipusk_kafedra = true 
  AND k.name_kafedra ILIKE '%математика%';


  INSERT INTO math_kafedra_teachers (number_kafedra, name_kafedra, familiya)
SELECT 
    p.number_kafedri, 
    k.name_kafedra, 
    p.familiya
FROM prepods p
JOIN kafedra k ON p.number_kafedri = k.number_kafedra
WHERE LEFT(p.familiya, 1) = LEFT(p.name, 1)
  AND LEFT(p.name, 1) = LEFT(p.otchestvo, 1);


  UPDATE math_kafedra_teachers
SET name_kafedra = 'прикладная математика и информатика'
WHERE number_kafedra % 2 = 0;


DELETE FROM math_kafedra_teachers
WHERE array_length(regexp_split_to_array(trim(name_kafedra), '\s+'), 1) > 4;

SELECT * FROM math_kafedra_teachers;


SELECT 
    k."code_ fakulteta", 
    COUNT(p.code_Prepods) AS kolichestvo_prepodavateley
FROM kafedra k
JOIN prepods p ON k.number_kafedra = p.number_kafedri
WHERE k.vipusk_kafedra = true
GROUP BY k."code_ fakulteta"
ORDER BY k."code_ fakulteta";
