; ModuleID = '../data/hip_kernels/1971/60/main.cu'
source_filename = "../data/hip_kernels/1971/60/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26kernel_evaluatenu_fl_eightifPffff(i32 %0, float %1, float addrspace(1)* nocapture %2, float %3, float %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp eq i32 %14, 0
  br i1 %16, label %17, label %75

17:                                               ; preds = %6
  %18 = fmul contract float %5, 5.000000e-01
  %19 = fadd contract float %18, 1.000000e+00
  %20 = fcmp contract olt float %19, 7.000000e+00
  br i1 %20, label %21, label %28

21:                                               ; preds = %17, %21
  %22 = phi float [ %26, %21 ], [ %19, %17 ]
  %23 = phi float [ %25, %21 ], [ 0.000000e+00, %17 ]
  %24 = fdiv contract float 1.000000e+00, %22
  %25 = fsub contract float %23, %24
  %26 = fadd contract float %22, 1.000000e+00
  %27 = fcmp contract olt float %26, 7.000000e+00
  br i1 %27, label %21, label %28, !llvm.loop !7

28:                                               ; preds = %21, %17
  %29 = phi float [ 0.000000e+00, %17 ], [ %25, %21 ]
  %30 = phi float [ %19, %17 ], [ %26, %21 ]
  %31 = fadd contract float %30, -5.000000e-01
  %32 = fdiv contract float 1.000000e+00, %31
  %33 = fmul contract float %32, %32
  %34 = fmul contract float %33, %33
  %35 = tail call i1 @llvm.amdgcn.class.f32(float %31, i32 144)
  %36 = select i1 %35, float 0x41F0000000000000, float 1.000000e+00
  %37 = fmul float %31, %36
  %38 = tail call float @llvm.log2.f32(float %37)
  %39 = fmul float %38, 0x3FE62E42E0000000
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 519)
  %41 = fneg float %39
  %42 = tail call float @llvm.fma.f32(float %38, float 0x3FE62E42E0000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %38, float 0x3E6EFA39E0000000, float %42)
  %44 = fadd float %39, %43
  %45 = select i1 %40, float %38, float %44
  %46 = select i1 %35, float 0x40362E4300000000, float 0.000000e+00
  %47 = fsub float %45, %46
  %48 = fmul contract float %33, 0x3FA5555560000000
  %49 = fadd contract float %48, %47
  %50 = fmul contract float %34, 0x3F7DDDDDE0000000
  %51 = fsub contract float %49, %50
  %52 = fmul contract float %34, 0x3F6F7DF7E0000000
  %53 = fmul contract float %33, %52
  %54 = fadd contract float %53, %51
  %55 = fmul contract float %34, 0x3F70EEEEE0000000
  %56 = fmul contract float %34, %55
  %57 = fsub contract float %54, %56
  %58 = fadd contract float %29, %57
  %59 = fadd contract float %5, 2.000000e+00
  %60 = fmul contract float %59, 5.000000e-01
  %61 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 144)
  %62 = select i1 %61, float 0x41F0000000000000, float 1.000000e+00
  %63 = fmul float %60, %62
  %64 = tail call float @llvm.log2.f32(float %63)
  %65 = fmul float %64, 0x3FE62E42E0000000
  %66 = tail call i1 @llvm.amdgcn.class.f32(float %64, i32 519)
  %67 = fneg float %65
  %68 = tail call float @llvm.fma.f32(float %64, float 0x3FE62E42E0000000, float %67)
  %69 = tail call float @llvm.fma.f32(float %64, float 0x3E6EFA39E0000000, float %68)
  %70 = fadd float %65, %69
  %71 = select i1 %66, float %64, float %70
  %72 = select i1 %61, float 0x40362E4300000000, float 0.000000e+00
  %73 = fsub float %71, %72
  %74 = fsub contract float %58, %73
  br label %75

75:                                               ; preds = %28, %6
  %76 = phi float [ %74, %28 ], [ undef, %6 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = icmp ult i32 %15, %0
  br i1 %77, label %78, label %141

78:                                               ; preds = %75
  %79 = uitofp i32 %15 to float
  %80 = fmul contract float %79, %3
  %81 = fadd contract float %80, %4
  %82 = zext i32 %15 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %82
  store float %76, float addrspace(1)* %83, align 4, !tbaa !9
  %84 = fmul contract float %81, 5.000000e-01
  %85 = fcmp contract olt float %84, 7.000000e+00
  br i1 %85, label %86, label %93

86:                                               ; preds = %78, %86
  %87 = phi float [ %91, %86 ], [ %84, %78 ]
  %88 = phi float [ %90, %86 ], [ 0.000000e+00, %78 ]
  %89 = fdiv contract float 1.000000e+00, %87
  %90 = fsub contract float %88, %89
  %91 = fadd contract float %87, 1.000000e+00
  %92 = fcmp contract olt float %91, 7.000000e+00
  br i1 %92, label %86, label %93, !llvm.loop !7

93:                                               ; preds = %86, %78
  %94 = phi float [ 0.000000e+00, %78 ], [ %90, %86 ]
  %95 = phi float [ %84, %78 ], [ %91, %86 ]
  %96 = fadd contract float %95, -5.000000e-01
  %97 = fdiv contract float 1.000000e+00, %96
  %98 = fmul contract float %97, %97
  %99 = fmul contract float %98, %98
  %100 = tail call i1 @llvm.amdgcn.class.f32(float %96, i32 144)
  %101 = select i1 %100, float 0x41F0000000000000, float 1.000000e+00
  %102 = fmul float %96, %101
  %103 = tail call float @llvm.log2.f32(float %102)
  %104 = fmul float %103, 0x3FE62E42E0000000
  %105 = tail call i1 @llvm.amdgcn.class.f32(float %103, i32 519)
  %106 = fneg float %104
  %107 = tail call float @llvm.fma.f32(float %103, float 0x3FE62E42E0000000, float %106)
  %108 = tail call float @llvm.fma.f32(float %103, float 0x3E6EFA39E0000000, float %107)
  %109 = fadd float %104, %108
  %110 = select i1 %105, float %103, float %109
  %111 = select i1 %100, float 0x40362E4300000000, float 0.000000e+00
  %112 = fsub float %110, %111
  %113 = fmul contract float %98, 0x3FA5555560000000
  %114 = fadd contract float %113, %112
  %115 = fmul contract float %99, 0x3F7DDDDDE0000000
  %116 = fsub contract float %114, %115
  %117 = fmul contract float %99, 0x3F6F7DF7E0000000
  %118 = fmul contract float %98, %117
  %119 = fadd contract float %118, %116
  %120 = fmul contract float %99, 0x3F70EEEEE0000000
  %121 = fmul contract float %99, %120
  %122 = fsub contract float %119, %121
  %123 = fadd contract float %94, %122
  %124 = tail call i1 @llvm.amdgcn.class.f32(float %84, i32 144)
  %125 = select i1 %124, float 0x41F0000000000000, float 1.000000e+00
  %126 = fmul float %84, %125
  %127 = tail call float @llvm.log2.f32(float %126)
  %128 = fmul float %127, 0x3FE62E42E0000000
  %129 = tail call i1 @llvm.amdgcn.class.f32(float %127, i32 519)
  %130 = fneg float %128
  %131 = tail call float @llvm.fma.f32(float %127, float 0x3FE62E42E0000000, float %130)
  %132 = tail call float @llvm.fma.f32(float %127, float 0x3E6EFA39E0000000, float %131)
  %133 = fadd float %128, %132
  %134 = select i1 %129, float %127, float %133
  %135 = select i1 %124, float 0x40362E4300000000, float 0.000000e+00
  %136 = fsub float %134, %135
  %137 = fsub contract float %136, %123
  %138 = fadd contract float %76, %137
  %139 = fsub contract float 1.000000e+00, %1
  %140 = fadd contract float %139, %138
  store float %140, float addrspace(1)* %83, align 4, !tbaa !9
  br label %141

141:                                              ; preds = %93, %75
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
