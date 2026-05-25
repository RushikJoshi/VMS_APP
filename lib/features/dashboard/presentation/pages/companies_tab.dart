import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dependency_injection/injection_container.dart';
import '../../../company_management/domain/entities/company_entity.dart';
import '../../../company_management/presentation/bloc/company_bloc.dart';
import '../../../company_management/presentation/bloc/company_event.dart';
import '../../../company_management/presentation/bloc/company_state.dart';
import '../../../company_management/presentation/pages/company_details_screen.dart';

class CompaniesTab extends StatelessWidget {
  const CompaniesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CompanyBloc>()..add(GetCompaniesEvent()),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Companies...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<CompanyBloc, CompanyState>(
                builder: (context, state) {
                  if (state is CompanyLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CompanyLoaded) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: state.companies.length,
                      itemBuilder: (context, index) {
                        return _buildCompanyCard(context, state.companies[index]);
                      },
                    );
                  } else if (state is CompanyError) {
                    return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          tooltip: 'Add Company',
        ),
      ),
    );
  }

  Widget _buildCompanyCard(BuildContext context, CompanyEntity company) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => CompanyDetailsScreen(companyName: company.name)));
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.business, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(company.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('${company.plan} Plan', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: company.status == 'Active' ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(company.status, style: TextStyle(color: company.status == 'Active' ? Colors.green : Colors.red, fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoSnippet(title: 'Users', value: company.usersCount.toString()),
                  _InfoSnippet(title: 'Revenue', value: company.revenue),
                  const _InfoSnippet(title: 'Since', value: 'Jan 2024'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoSnippet extends StatelessWidget {
  final String title;
  final String value;

  const _InfoSnippet({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      ],
    );
  }
}
