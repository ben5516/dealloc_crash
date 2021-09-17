class Thing
  def dealloc
    puts "clean up"
    super
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'ivar_dealloc'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    @thing = Thing.new

    button = UIButton.alloc.init
    button.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)
    button.setTitle("Crash It", forState:UIControlStateNormal)
    button.addTarget(self, action: "crash_it", forControlEvents: UIControlEventTouchUpInside)

    button.frame = CGRectMake(screen_size.width / 2 - 75, screen_size.height / 2 - 25, 150, 50)

    rootViewController.view.addSubview(button)

    true
  end

  def crash_it
    @thing = nil
  end

  def crash_it2
    Thing.new
  end

  def screen_size
    @screen_size ||= @window.frame.size
  end
end
