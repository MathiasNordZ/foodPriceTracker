import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  _CreateProductState createState() {
    return _CreateProductState();
  }
}

class _CreateProductState extends State<CreateProduct> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  String? _selectedUnit;

  // Function to show date picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020), // earliest allowed date
      lastDate: DateTime(2100), // latest allowed date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opprett Vare"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView( // <-- use ListView so it scrolls
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Varenavn",
                  hintText: "Skriv inn varenavn",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "* Obligatorisk felt";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Produsent",
                  hintText: "Skriv inn produsent",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "* Obligatorisk felt";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Pris",
                  hintText: "Skriv inn pris",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "* Obligatorisk felt";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Mengde with radio buttons for unit
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Mengde",
                  hintText: "Skriv inn mengde",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "* Obligatorisk felt";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              const Text("Enhet:", style: TextStyle(fontWeight: FontWeight.bold)),
              Wrap(
                spacing: 8,
                children: ["kg", "g", "L", "ml"].map((unit) {
                  return ChoiceChip(
                    label: Text(unit),
                    selected: _selectedUnit == unit,
                    onSelected: (selected) {
                      setState(() {
                        _selectedUnit = selected ? unit : null;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Butikk-kjede",
                  hintText: "Skriv inn kjede",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "* Obligatorisk felt";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Date picker
              ListTile(
                title: Text(
                  _selectedDate == null
                      ? "Når ble varen kjøpt?"
                      : "Valgt dato: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _pickDate(context),
              ),

              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _selectedUnit != null &&
                      _selectedDate != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Prosesserer data...")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Vennligst fyll ut alt")),
                    );
                  }
                },
                child: const Text(
                  "Opprett",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}