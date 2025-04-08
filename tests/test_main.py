from src.main import main

def test_main_output(capsys):
    main()
    captured = capsys.readouterr()
    assert captured.out.strip() == "Hello from your starter Python project!"
