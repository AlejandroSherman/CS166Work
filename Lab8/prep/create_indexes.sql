CREATE INDEX part_nyc_part_number_index
ON part_nyc (part_number);

CREATE INDEX part_nyc_supplier_index
ON part_nyc (supplier);

CREATE INDEX part_nyc_color_index
ON part_nyc (color);

CREATE INDEX part_nyc_on_hand_index
ON part_nyc (on_hand);

CREATE INDEX part_sfo_part_number_index
ON part_sfo (part_number);

CREATE INDEX part_sfo_supplier_index
ON part_sfo (supplier);

CREATE INDEX part_sfo_color_index
ON part_sfo (color);

CREATE INDEX part_sfo_on_hand_index
ON part_sfo (on_hand);

CREATE INDEX supplier__supplier_id_index
ON supplier (supplier_id);

CREATE INDEX supplier_supplier_name_index
ON supplier (supplier_name);

CREATE INDEX color_color_id_index
ON color (color_id);

CREATE INDEX color_color_name_index
ON color (color_name);
