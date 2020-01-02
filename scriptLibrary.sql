-- Template for returning unmatched rows
FROM ltable
	LEFT OUTER JOIN rtable
		ON rtable.fk = ltable.pk
WHERE 
	rtable.fk IS NULL;

