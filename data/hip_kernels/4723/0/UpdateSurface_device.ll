; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/4723/0/UpdateSurface.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/4723/0/UpdateSurface.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z13UpdateSurfaceP13__hip_surfacejjf(%struct.__hip_surface addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp uge i32 %21, %2
  %23 = icmp uge i32 %13, %1
  %24 = or i1 %23, %22
  br i1 %24, label %135, label %25

25:                                               ; preds = %4
  %26 = uitofp i32 %13 to float
  %27 = uitofp i32 %1 to float
  %28 = fdiv contract float %26, %27
  %29 = uitofp i32 %21 to float
  %30 = uitofp i32 %2 to float
  %31 = fdiv contract float %29, %30
  %32 = tail call float @llvm.cos.f32(float %3)
  %33 = fmul contract float %32, 5.000000e-01
  %34 = fadd contract float %33, %28
  %35 = fmul contract float %29, %3
  %36 = tail call float @llvm.cos.f32(float %35)
  %37 = fmul contract float %36, 5.000000e-01
  %38 = fadd contract float %31, %37
  %39 = fdiv contract float %26, 1.000000e+02
  %40 = fmul contract float %39, %3
  %41 = tail call float @llvm.cos.f32(float %40)
  %42 = fmul contract float %41, 5.000000e-01
  %43 = fadd contract float %28, %42
  %44 = icmp eq i32 %21, 0
  br i1 %44, label %45, label %54

45:                                               ; preds = %25
  %46 = fpext float %43 to double
  %47 = fmul contract double %46, 3.000000e-01
  %48 = fptrunc double %47 to float
  %49 = fmul contract double %46, 4.000000e-01
  %50 = fptrunc double %49 to float
  %51 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %48, i64 0
  %52 = insertelement <4 x float> %51, float %43, i64 1
  %53 = insertelement <4 x float> %52, float %50, i64 2
  br label %101

54:                                               ; preds = %25
  %55 = add i32 %2, -1
  %56 = icmp eq i32 %21, %55
  br i1 %56, label %57, label %66

57:                                               ; preds = %54
  %58 = fpext float %43 to double
  %59 = fmul contract double %58, 6.000000e-01
  %60 = fptrunc double %59 to float
  %61 = fmul contract double %58, 0x3FE6666666666666
  %62 = fptrunc double %61 to float
  %63 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %60, i64 0
  %64 = insertelement <4 x float> %63, float %62, i64 1
  %65 = insertelement <4 x float> %64, float %43, i64 2
  br label %101

66:                                               ; preds = %54
  %67 = and i32 %13, 1
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %76

69:                                               ; preds = %66
  %70 = lshr i32 %1, 1
  %71 = icmp ugt i32 %13, %70
  br i1 %71, label %72, label %74

72:                                               ; preds = %69
  %73 = insertelement <4 x float> <float 0x3FB99999A0000000, float 5.000000e-01, float poison, float 1.000000e+00>, float %34, i64 2
  br label %101

74:                                               ; preds = %69
  %75 = insertelement <4 x float> <float poison, float 0x3FB99999A0000000, float 0x3FC99999A0000000, float 1.000000e+00>, float %34, i64 0
  br label %101

76:                                               ; preds = %66
  %77 = add i32 %1, -2
  %78 = icmp ugt i32 %13, %77
  %79 = icmp ult i32 %13, 2
  %80 = or i1 %78, %79
  br i1 %80, label %81, label %90

81:                                               ; preds = %76
  %82 = fpext float %38 to double
  %83 = fmul contract double %82, 9.000000e-01
  %84 = fptrunc double %83 to float
  %85 = fmul contract double %82, 6.000000e-01
  %86 = fptrunc double %85 to float
  %87 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %38, i64 0
  %88 = insertelement <4 x float> %87, float %84, i64 1
  %89 = insertelement <4 x float> %88, float %86, i64 2
  br label %101

90:                                               ; preds = %76
  %91 = fpext float %34 to double
  %92 = fmul contract double %91, 3.000000e-01
  %93 = fptrunc double %92 to float
  %94 = fmul contract double %91, 4.000000e-01
  %95 = fptrunc double %94 to float
  %96 = fmul contract double %91, 6.000000e-01
  %97 = fptrunc double %96 to float
  %98 = insertelement <4 x float> <float poison, float poison, float poison, float 1.000000e+00>, float %93, i64 0
  %99 = insertelement <4 x float> %98, float %95, i64 1
  %100 = insertelement <4 x float> %99, float %97, i64 2
  br label %101

101:                                              ; preds = %57, %81, %90, %72, %74, %45
  %102 = phi <4 x float> [ %53, %45 ], [ %65, %57 ], [ %73, %72 ], [ %75, %74 ], [ %89, %81 ], [ %100, %90 ]
  %103 = shl i32 %13, 4
  %104 = bitcast %struct.__hip_surface addrspace(1)* %0 to i32 addrspace(1)*
  %105 = addrspacecast i32 addrspace(1)* %104 to i32 addrspace(4)*
  %106 = getelementptr inbounds i32, i32 addrspace(4)* %105, i64 8
  %107 = load i32, i32 addrspace(4)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = getelementptr inbounds i32, i32 addrspace(4)* %105, i64 9
  %109 = load i32, i32 addrspace(4)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = icmp eq i32 %107, 4
  br i1 %110, label %111, label %113

111:                                              ; preds = %101
  %112 = sdiv i32 %103, 3
  br label %118

113:                                              ; preds = %101
  %114 = sext i32 %107 to i64
  %115 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %114
  %116 = load i32, i32 addrspace(4)* %115, align 4, !tbaa !11
  %117 = ashr i32 %103, %116
  br label %118

118:                                              ; preds = %113, %111
  %119 = phi i32 [ %112, %111 ], [ %117, %113 ]
  %120 = sext i32 %109 to i64
  %121 = lshr i64 4176, %120
  %122 = and i64 %121, 1
  %123 = icmp eq i64 %122, 0
  br i1 %123, label %126, label %124

124:                                              ; preds = %118
  %125 = sdiv i32 %119, 3
  br label %130

126:                                              ; preds = %118
  %127 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %120
  %128 = load i32, i32 addrspace(4)* %127, align 4, !tbaa !11
  %129 = ashr i32 %119, %128
  br label %130

130:                                              ; preds = %124, %126
  %131 = phi i32 [ %125, %124 ], [ %129, %126 ]
  %132 = bitcast %struct.__hip_surface addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %133 = addrspacecast <8 x i32> addrspace(1)* %132 to <8 x i32> addrspace(4)*
  %134 = load <8 x i32>, <8 x i32> addrspace(4)* %133, align 32, !tbaa !15, !amdgpu.noclobber !5
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %102, i32 15, i32 %131, i32 %21, <8 x i32> %134, i32 0, i32 0)
  br label %135

135:                                              ; preds = %4, %130
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.cos.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nounwind willreturn writeonly
declare void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float>, i32 immarg, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { mustprogress norecurse nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nounwind willreturn writeonly }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!9, !9, i64 0}
