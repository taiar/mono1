<?php

class Node {
	
	public $left;
	public $right;
	public $value;

	public function __construct($value) {
		$this->value = $value;
	}
}

$pesquisa = new Node(1);
$pesquisa->left = new Node(2);
$pesquisa->left->left = new Node(4);
$pesquisa->left->left->left = new Node(8);
$pesquisa->left->left->right = new Node(9);

$pesquisa->left->right = new Node(5);
$pesquisa->left->right->left = new Node(10);
$pesquisa->left->right->right = new Node(11);

$pesquisa->right = new Node(3);
$pesquisa->right->left = new Node(6);
$pesquisa->right->left->left = new Node(12);
$pesquisa->right->left->right = new Node(13);

$pesquisa->right->right = new Node(7);
$pesquisa->right->right->left = new Node(14);
$pesquisa->right->right->right = new Node(15);

function caminhamento_central($arvore) {
	if($arvore->left != null) caminhamento_central($arvore->left); 
	echo $arvore->value . " ";
	if($arvore->right != null) caminhamento_central($arvore->right); 
}

caminhamento_central($pesquisa);
echo PHP_EOL;
