SELECT COUNT(*)
FROM part_nyc P
WHERE P.on_hand>70;

SELECT SUM(
 ( SELECT COUNT(N.on_hand)
 FROM part_nyc N, color C
 WHERE N.color=C.color_id AND C.color_name='Red')
 +
 ( SELECT COUNT(S.on_hand)
 FROM part_sfo S, color C
 WHERE S.color=C.color_id AND C.color_name='Red')
);

SELECT S.supplier_id, S.supplier_name
FROM supplier S
WHERE
 ( SELECT SUM(N.on_hand)
 FROM part_nyc N
 WHERE S.supplier_id=N.supplier)
 >
 ( SELECT SUM(SF.on_hand)
 FROM part_sfo SF
 WHERE S.supplier_id=SF.supplier)
ORDER BY S.supplier_id;

SELECT DISTINCT S.supplier_id, S.supplier_name
FROM supplier S, part_nyc P
WHERE S.supplier_id=P.supplier AND P.part_number IN
 ( SELECT P2.part_number
 FROM supplier S, part_nyc P2
 WHERE S.supplier_id=P2.supplier
 EXCEPT
 SELECT SF.part_number
 FROM supplier S, part_sfo SF
 WHERE S.supplier_id=SF.supplier
 )
ORDER BY S.supplier_id;

UPDATE part_nyc
SET on_hand=on_hand-10
WHERE on_hand>=10;

DELETE FROM part_nyc
WHERE on_hand<30;
