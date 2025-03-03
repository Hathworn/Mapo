; ModuleID = '../data/hip_kernels/7733/1/main.cu'
source_filename = "../data/hip_kernels/7733/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z4NOVAPdS_Piid(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, double %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !5
  %18 = mul nsw i32 %14, %3
  %19 = add nsw i32 %18, %14
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds double, double addrspace(1)* %1, i64 %20
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !5
  %23 = fmul contract double %22, %4
  %24 = fcmp olt double %23, 0x1000000000000000
  %25 = select i1 %24, double 0x4FF0000000000000, double 1.000000e+00
  %26 = fmul double %23, %25
  %27 = tail call double @llvm.amdgcn.rsq.f64(double %26)
  %28 = fmul double %26, %27
  %29 = fmul double %27, 5.000000e-01
  %30 = fneg double %29
  %31 = tail call double @llvm.fma.f64(double %30, double %28, double 5.000000e-01)
  %32 = tail call double @llvm.fma.f64(double %29, double %31, double %29)
  %33 = tail call double @llvm.fma.f64(double %28, double %31, double %28)
  %34 = fneg double %33
  %35 = tail call double @llvm.fma.f64(double %34, double %33, double %26)
  %36 = tail call double @llvm.fma.f64(double %35, double %32, double %33)
  %37 = fneg double %36
  %38 = tail call double @llvm.fma.f64(double %37, double %36, double %26)
  %39 = tail call double @llvm.fma.f64(double %38, double %32, double %36)
  %40 = select i1 %24, double 0x37F0000000000000, double 1.000000e+00
  %41 = fmul double %40, %39
  %42 = fcmp oeq double %26, 0.000000e+00
  %43 = fcmp oeq double %26, 0x7FF0000000000000
  %44 = or i1 %42, %43
  %45 = select i1 %44, double %26, double %41
  %46 = fdiv contract double %17, %45
  %47 = tail call double @llvm.fabs.f64(double %46)
  %48 = fcmp olt double %47, 1.000000e+00
  br i1 %48, label %49, label %63

49:                                               ; preds = %5
  %50 = fmul double %46, %46
  %51 = tail call double @llvm.fma.f64(double %50, double 0xBE0AB15C51D2EBEB, double 0x3E4D6E3DDFEB1F49)
  %52 = tail call double @llvm.fma.f64(double %50, double %51, double 0xBE85BFE763844720)
  %53 = tail call double @llvm.fma.f64(double %50, double %52, double 0x3EBB97E44280CFB9)
  %54 = tail call double @llvm.fma.f64(double %50, double %53, double 0xBEEF4CA204C771C5)
  %55 = tail call double @llvm.fma.f64(double %50, double %54, double 0x3F1F9A2B75531772)
  %56 = tail call double @llvm.fma.f64(double %50, double %55, double 0xBF4C02DB0149D904)
  %57 = tail call double @llvm.fma.f64(double %50, double %56, double 0x3F7565BCCF7E2856)
  %58 = tail call double @llvm.fma.f64(double %50, double %57, double 0xBF9B82CE311EE09B)
  %59 = tail call double @llvm.fma.f64(double %50, double %58, double 0x3FBCE2F21A0408D1)
  %60 = tail call double @llvm.fma.f64(double %50, double %59, double 0xBFD812746B0379B2)
  %61 = tail call double @llvm.fma.f64(double %50, double %60, double 0x3FC06EBA8214DB68)
  %62 = tail call double @llvm.fma.f64(double %47, double %61, double %47)
  br label %111

63:                                               ; preds = %5
  %64 = tail call double @llvm.fma.f64(double %47, double 0x3C598D37C14B24BE, double 0xBCC145A3502A41CD)
  %65 = tail call double @llvm.fma.f64(double %47, double %64, double 0x3D162DEED735F9EC)
  %66 = tail call double @llvm.fma.f64(double %47, double %65, double 0xBD61FFE55552CA22)
  %67 = tail call double @llvm.fma.f64(double %47, double %66, double 0x3DA4B9BA7074B644)
  %68 = tail call double @llvm.fma.f64(double %47, double %67, double 0xBDE20345A78CE240)
  %69 = tail call double @llvm.fma.f64(double %47, double %68, double 0x3E188B7A0CEFDDD8)
  %70 = tail call double @llvm.fma.f64(double %47, double %69, double 0xBE4ADED48C94B617)
  %71 = tail call double @llvm.fma.f64(double %47, double %70, double 0x3E7803AA312306D0)
  %72 = tail call double @llvm.fma.f64(double %47, double %71, double 0xBEA1B0106F4C5A9B)
  %73 = tail call double @llvm.fma.f64(double %47, double %72, double 0x3EC58C0E7CFD79AE)
  %74 = tail call double @llvm.fma.f64(double %47, double %73, double 0xBEE59E386410FDF7)
  %75 = tail call double @llvm.fma.f64(double %47, double %74, double 0x3F0192FC1F9B1786)
  %76 = tail call double @llvm.fma.f64(double %47, double %75, double 0xBF162CF3F4634B2E)
  %77 = tail call double @llvm.fma.f64(double %47, double %76, double 0x3F2314DFB42F7E4B)
  %78 = tail call double @llvm.fma.f64(double %47, double %77, double 0xBF12CB68C047288A)
  %79 = tail call double @llvm.fma.f64(double %47, double %78, double 0xBF4038FF7BBCCE25)
  %80 = tail call double @llvm.fma.f64(double %47, double %79, double 0x3F5A9466AE1BABAE)
  %81 = tail call double @llvm.fma.f64(double %47, double %80, double 0xBF258BE1E65A6063)
  %82 = tail call double @llvm.fma.f64(double %47, double %81, double 0xBF939BC16738EE3A)
  %83 = tail call double @llvm.fma.f64(double %47, double %82, double 0x3FBA4FBC28146B69)
  %84 = tail call double @llvm.fma.f64(double %47, double %83, double 0x3FE45F2DA69750C4)
  %85 = tail call double @llvm.fma.f64(double %47, double %84, double 0x3FC06EBB919FCCA8)
  %86 = tail call double @llvm.fma.f64(double %47, double %85, double %47)
  %87 = fneg double %86
  %88 = fmul double %86, 0xBFF71547652B82FE
  %89 = tail call double @llvm.rint.f64(double %88)
  %90 = fneg double %89
  %91 = tail call double @llvm.fma.f64(double %90, double 0x3FE62E42FEFA39EF, double %87)
  %92 = tail call double @llvm.fma.f64(double %90, double 0x3C7ABC9E3B39803F, double %91)
  %93 = tail call double @llvm.fma.f64(double %92, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %94 = tail call double @llvm.fma.f64(double %92, double %93, double 0x3EC71DEE623FDE64)
  %95 = tail call double @llvm.fma.f64(double %92, double %94, double 0x3EFA01997C89E6B0)
  %96 = tail call double @llvm.fma.f64(double %92, double %95, double 0x3F2A01A014761F6E)
  %97 = tail call double @llvm.fma.f64(double %92, double %96, double 0x3F56C16C1852B7B0)
  %98 = tail call double @llvm.fma.f64(double %92, double %97, double 0x3F81111111122322)
  %99 = tail call double @llvm.fma.f64(double %92, double %98, double 0x3FA55555555502A1)
  %100 = tail call double @llvm.fma.f64(double %92, double %99, double 0x3FC5555555555511)
  %101 = tail call double @llvm.fma.f64(double %92, double %100, double 0x3FE000000000000B)
  %102 = tail call double @llvm.fma.f64(double %92, double %101, double 1.000000e+00)
  %103 = tail call double @llvm.fma.f64(double %92, double %102, double 1.000000e+00)
  %104 = fptosi double %89 to i32
  %105 = tail call double @llvm.amdgcn.ldexp.f64(double %103, i32 %104)
  %106 = fcmp olt double %86, -1.024000e+03
  %107 = fcmp ogt double %86, 1.075000e+03
  %108 = fsub double 1.000000e+00, %105
  %109 = select i1 %106, double 0xFFF0000000000000, double %108
  %110 = select i1 %107, double 1.000000e+00, double %109
  br label %111

111:                                              ; preds = %49, %63
  %112 = phi double [ %62, %49 ], [ %110, %63 ]
  %113 = tail call double @llvm.copysign.f64(double %112, double %46)
  %114 = fsub contract double 1.000000e+00, %113
  %115 = fmul contract double %114, 2.000000e+00
  %116 = fcmp contract olt double %115, 2.500000e-01
  %117 = zext i1 %116 to i32
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %15
  store i32 %117, i32 addrspace(1)* %118, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
