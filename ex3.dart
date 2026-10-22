class ItemPedido {
  final String nome;
  final double preco;
  final int quantidade;

  ItemPedido({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });

  void exibirLinha() {
    final double subtotal = preco * quantidade;
    print(
      '$quantidade x $nome (R\$ ${preco.toStringAsFixed(2)}) = R\$ ${subtotal.toStringAsFixed(2)}',
    );
  }
}

class Pedido {
  final String cliente;
  List<ItemPedido> itens = [];

  Pedido(this.cliente);

  void adicionarItem(ItemPedido item) {
    itens.add(item);
  }

  void mostrarResumo() {
    print('Pedido de $cliente');

    double subtotal = 0;
    for (final item in itens) {
      item.exibirLinha();
      subtotal += item.preco * item.quantidade;
    }

    print('Subtotal: R\$ ${subtotal.toStringAsFixed(2)}');

    double total = subtotal;
    if (subtotal > 200) {
      final double desconto = subtotal * 0.10;
      total = subtotal - desconto;
      print('Desconto (10%): R\$ ${desconto.toStringAsFixed(2)}');
    }

    print('Total a pagar: R\$ ${total.toStringAsFixed(2)}');
  }
}

void main() {
  final pedido = Pedido('Carla');

  pedido.adicionarItem(
    ItemPedido(nome: 'Teclado', preco: 150.00, quantidade: 1),
  );
  pedido.adicionarItem(ItemPedido(nome: 'Mouse', preco: 89.90, quantidade: 2));
  pedido.adicionarItem(
    ItemPedido(nome: 'Mousepad', preco: 35.50, quantidade: 1),
  );

  pedido.mostrarResumo();
}
