import 'package:flutter/material.dart';
import 'package:section27/screen/food/food_view_model.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<FoodScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FoodViewModel>(context, listen: false).getAllFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<FoodViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Makanan'),
      ),
      body: ListView.builder(
        itemCount: modelView.foods.length,
        itemBuilder: (context, index) {
          final contact = modelView.foods[index];
          return Card(
            elevation: 8,
            child: ListTile(
              title: Text(
                contact.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget body(FoodViewModel viewModel) {
    final isLoading = viewModel.state == FoodViewState.loading;
    final isError = viewModel.state == FoodViewState.error;

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (isError) {
      return Center(child: Text('Gagagl mengambil data'));
    }
    return listView(viewModel);
  }

  Widget listView(FoodViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.foods.length,
      itemBuilder: (context, index) {
        final contact = viewModel.foods[index];
        return ListTile(
          title: Text(contact.name),
        );
      },
    );
  }
}
