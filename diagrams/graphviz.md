Online playground http://www.webgraphviz.com/

Few examples http://graphs.grevian.org/example

https://en.wikipedia.org/wiki/DOT_(graph_description_language)

`man dot` for more details.

```c
strict graph G {
	// general graph properties
	node [style=filled];

	// short variable reference names, and actual names.
	w [label="work" color="green"];
	h [label="home" color="orange"];
	n [label="news" color="yellow"];
	m [label="mind" color="red"];

	// to group 
	subgraph cluster_work {
		style=filled;
		color=lightgrey;
		node [style=filled,color=white];
		w -- a0 -- a1;
		w -- a2;
		label = "work";
	}

	subgraph cluster_home {
		node [style=filled];
		h -- { sp1 sp2 };
		label = "home";
		color=blue;
	}

	subgraph cluster_news {
		n -- {n1 n2 n3 n4 };
		label = "news";
	}

	subgraph cluster_mind {
		m -- {m1 m2 };
		label = "mind";
	}

	// links outside of subgraphs
	w -- { p1 };
	p1 -- sp1;
	
	// editing edge properties
	sp2 -- n2 [label="sp2n2link"];
	n1 -- m1 [color="red"];
	n4 -- z4 -- m2 [style=dotted];
}
```

Also use `->` for directed graphs. e.g.
```
digraph graphname {
a -> b
}
```

This can be run like.

```
dot -Tsvg dag.dot -o dag.svg && chrome dag.svg
```

To render this within github markdown https://github.com/TLmaK0/gravizo
