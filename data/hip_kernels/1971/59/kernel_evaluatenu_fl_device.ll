; ModuleID = '../data/hip_kernels/1971/59/main.cu'
source_filename = "../data/hip_kernels/1971/59/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20kernel_evaluatenu_flifPfff(i32 %0, float %1, float addrspace(1)* nocapture %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %0
  br i1 %15, label %16, label %135

16:                                               ; preds = %5
  %17 = uitofp i32 %14 to float
  %18 = fmul contract float %17, %3
  %19 = fadd contract float %18, %4
  %20 = fmul contract float %19, 5.000000e-01
  %21 = fadd contract float %20, 5.000000e-01
  %22 = fcmp contract olt float %21, 7.000000e+00
  br i1 %22, label %23, label %30

23:                                               ; preds = %16, %23
  %24 = phi float [ %28, %23 ], [ %21, %16 ]
  %25 = phi float [ %27, %23 ], [ 0.000000e+00, %16 ]
  %26 = fdiv contract float 1.000000e+00, %24
  %27 = fsub contract float %25, %26
  %28 = fadd contract float %24, 1.000000e+00
  %29 = fcmp contract olt float %28, 7.000000e+00
  br i1 %29, label %23, label %30, !llvm.loop !7

30:                                               ; preds = %23, %16
  %31 = phi float [ 0.000000e+00, %16 ], [ %27, %23 ]
  %32 = phi float [ %21, %16 ], [ %28, %23 ]
  %33 = fadd contract float %32, -5.000000e-01
  %34 = fdiv contract float 1.000000e+00, %33
  %35 = fmul contract float %34, %34
  %36 = fmul contract float %35, %35
  %37 = tail call i1 @llvm.amdgcn.class.f32(float %33, i32 144)
  %38 = select i1 %37, float 0x41F0000000000000, float 1.000000e+00
  %39 = fmul float %33, %38
  %40 = tail call float @llvm.log2.f32(float %39)
  %41 = fmul float %40, 0x3FE62E42E0000000
  %42 = tail call i1 @llvm.amdgcn.class.f32(float %40, i32 519)
  %43 = fneg float %41
  %44 = tail call float @llvm.fma.f32(float %40, float 0x3FE62E42E0000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %40, float 0x3E6EFA39E0000000, float %44)
  %46 = fadd float %41, %45
  %47 = select i1 %42, float %40, float %46
  %48 = select i1 %37, float 0x40362E4300000000, float 0.000000e+00
  %49 = fsub float %47, %48
  %50 = fmul contract float %35, 0x3FA5555560000000
  %51 = fadd contract float %50, %49
  %52 = fmul contract float %36, 0x3F7DDDDDE0000000
  %53 = fsub contract float %51, %52
  %54 = fmul contract float %36, 0x3F6F7DF7E0000000
  %55 = fmul contract float %35, %54
  %56 = fadd contract float %55, %53
  %57 = fmul contract float %36, 0x3F70EEEEE0000000
  %58 = fmul contract float %36, %57
  %59 = fsub contract float %56, %58
  %60 = fadd contract float %31, %59
  %61 = fadd contract float %19, 1.000000e+00
  %62 = fmul contract float %61, 5.000000e-01
  %63 = tail call i1 @llvm.amdgcn.class.f32(float %62, i32 144)
  %64 = select i1 %63, float 0x41F0000000000000, float 1.000000e+00
  %65 = fmul float %62, %64
  %66 = tail call float @llvm.log2.f32(float %65)
  %67 = fmul float %66, 0x3FE62E42E0000000
  %68 = tail call i1 @llvm.amdgcn.class.f32(float %66, i32 519)
  %69 = fneg float %67
  %70 = tail call float @llvm.fma.f32(float %66, float 0x3FE62E42E0000000, float %69)
  %71 = tail call float @llvm.fma.f32(float %66, float 0x3E6EFA39E0000000, float %70)
  %72 = fadd float %67, %71
  %73 = select i1 %68, float %66, float %72
  %74 = select i1 %63, float 0x40362E4300000000, float 0.000000e+00
  %75 = fsub float %73, %74
  %76 = fsub contract float %60, %75
  %77 = zext i32 %14 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  store float %76, float addrspace(1)* %78, align 4, !tbaa !9
  %79 = fcmp contract olt float %20, 7.000000e+00
  br i1 %79, label %80, label %87

80:                                               ; preds = %30, %80
  %81 = phi float [ %85, %80 ], [ %20, %30 ]
  %82 = phi float [ %84, %80 ], [ 0.000000e+00, %30 ]
  %83 = fdiv contract float 1.000000e+00, %81
  %84 = fsub contract float %82, %83
  %85 = fadd contract float %81, 1.000000e+00
  %86 = fcmp contract olt float %85, 7.000000e+00
  br i1 %86, label %80, label %87, !llvm.loop !7

87:                                               ; preds = %80, %30
  %88 = phi float [ 0.000000e+00, %30 ], [ %84, %80 ]
  %89 = phi float [ %20, %30 ], [ %85, %80 ]
  %90 = fadd contract float %89, -5.000000e-01
  %91 = fdiv contract float 1.000000e+00, %90
  %92 = fmul contract float %91, %91
  %93 = fmul contract float %92, %92
  %94 = tail call i1 @llvm.amdgcn.class.f32(float %90, i32 144)
  %95 = select i1 %94, float 0x41F0000000000000, float 1.000000e+00
  %96 = fmul float %90, %95
  %97 = tail call float @llvm.log2.f32(float %96)
  %98 = fmul float %97, 0x3FE62E42E0000000
  %99 = tail call i1 @llvm.amdgcn.class.f32(float %97, i32 519)
  %100 = fneg float %98
  %101 = tail call float @llvm.fma.f32(float %97, float 0x3FE62E42E0000000, float %100)
  %102 = tail call float @llvm.fma.f32(float %97, float 0x3E6EFA39E0000000, float %101)
  %103 = fadd float %98, %102
  %104 = select i1 %99, float %97, float %103
  %105 = select i1 %94, float 0x40362E4300000000, float 0.000000e+00
  %106 = fsub float %104, %105
  %107 = fmul contract float %92, 0x3FA5555560000000
  %108 = fadd contract float %107, %106
  %109 = fmul contract float %93, 0x3F7DDDDDE0000000
  %110 = fsub contract float %108, %109
  %111 = fmul contract float %93, 0x3F6F7DF7E0000000
  %112 = fmul contract float %92, %111
  %113 = fadd contract float %112, %110
  %114 = fmul contract float %93, 0x3F70EEEEE0000000
  %115 = fmul contract float %93, %114
  %116 = fsub contract float %113, %115
  %117 = fadd contract float %88, %116
  %118 = tail call i1 @llvm.amdgcn.class.f32(float %20, i32 144)
  %119 = select i1 %118, float 0x41F0000000000000, float 1.000000e+00
  %120 = fmul float %20, %119
  %121 = tail call float @llvm.log2.f32(float %120)
  %122 = fmul float %121, 0x3FE62E42E0000000
  %123 = tail call i1 @llvm.amdgcn.class.f32(float %121, i32 519)
  %124 = fneg float %122
  %125 = tail call float @llvm.fma.f32(float %121, float 0x3FE62E42E0000000, float %124)
  %126 = tail call float @llvm.fma.f32(float %121, float 0x3E6EFA39E0000000, float %125)
  %127 = fadd float %122, %126
  %128 = select i1 %123, float %121, float %127
  %129 = select i1 %118, float 0x40362E4300000000, float 0.000000e+00
  %130 = fsub float %128, %129
  %131 = fsub contract float %130, %117
  %132 = fadd contract float %76, %131
  %133 = fsub contract float 1.000000e+00, %1
  %134 = fadd contract float %133, %132
  store float %134, float addrspace(1)* %78, align 4, !tbaa !9
  br label %135

135:                                              ; preds = %87, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
