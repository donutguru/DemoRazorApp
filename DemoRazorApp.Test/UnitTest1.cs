using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DemoRazorApp.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void MyTestThatPasses()
        {
            Assert.AreEqual(true, true);
            //Assert.AreEqual(true, false);
        }

        [TestMethod]
        public void MyTestThatFails()
        {
            //Assert.AreEqual(true, true);
            Assert.AreEqual(true, false);
        }
    }
}