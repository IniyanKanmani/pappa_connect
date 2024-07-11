import 'package:pappa_connect/core/usecase/usecase.dart';

class PostcodeSearchFieldTypedDataEntryUseCase extends UseCase {
  PostcodeSearchFieldTypedDataEntryUseCase();

  @override
  Future call({params}) async {
    String value = params['value'];
    Function(String) scrapeAddress = params['scrape_address'];
    Map<String, dynamic> dataEntryData = params['data_entry_data'];

    String jsCode = '''
        document.getElementsByTagName('input')[0].dispatchEvent(new KeyboardEvent('keydown', {
          key: 'Enter',
          code: 'Enter',
          keyCode: 13,
          which: 13,
          bubbles: true,
          cancelable: true
        }));
        
        document.getElementsByTagName('input')[0].value = '$value';
        document.getElementsByTagName('input')[0].dispatchEvent(new Event('input', { bubbles: true }));
        
        targetNode = document.getElementsByTagName('ul')[2];
        observer = new MutationObserver((mutationsList, observer) => {
          for (const mutation of mutationsList) {
            if (mutation.type === 'childList') {
              const titles = Array.from(targetNode.getElementsByTagName('li')).map(li => li.getAttribute('title'));
              FlutterChannel.postMessage(JSON.stringify(titles));
            }
          }
        });
        
        observer.observe(targetNode, { childList: true, subtree: true });
        
        setTimeout(() => {
          observer.disconnect();
        }, 500);
      ''';

    dataEntryData['postcode_search'] = value;
    dataEntryData['postcode_search_edited'] = true;

    if (value.trim().length > 4) {
      scrapeAddress(jsCode);
    }
  }
}
