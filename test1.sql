CREATE OR REPLACE FUNCTION insert_cats_data(mb_size INTEGER)
RETURNS VOID AS $$
DECLARE
    data_size INTEGER;
    data_to_insert TEXT;
    mb_per_row INTEGER := 10; -- Примерное количество байт на строку
BEGIN
    -- Вычисляем количество строк, которые можно вставить в заданный объем данных
    data_size := mb_size * 1024 * 1024 / mb_per_row;

    -- Генерируем данные для вставки
    data_to_insert := REPEAT('a', data_size);

    -- Вставляем данные в таблицу
    EXECUTE 'INSERT INTO cats ("name") SELECT generate_series(1, $1)'
    USING data_size;
END;
$$ LANGUAGE plpgsql;


----------------------------------------------------------
SELECT insert_cats_data(desired_mb_size); 
