; ModuleID = '../data/hip_kernels/16673/82/main.cu'
source_filename = "../data/hip_kernels/16673/82/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14scan_v1_kernelPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sgt i32 %2, 0
  br i1 %13, label %14, label %40

14:                                               ; preds = %3
  %15 = and i32 %2, 7
  %16 = icmp ult i32 %2, 8
  br i1 %16, label %19, label %17

17:                                               ; preds = %14
  %18 = and i32 %2, -8
  br label %44

19:                                               ; preds = %125, %14
  %20 = phi float [ undef, %14 ], [ %126, %125 ]
  %21 = phi i32 [ 0, %14 ], [ %127, %125 ]
  %22 = phi float [ 0.000000e+00, %14 ], [ %126, %125 ]
  %23 = icmp eq i32 %15, 0
  br i1 %23, label %40, label %24

24:                                               ; preds = %19, %35
  %25 = phi i32 [ %37, %35 ], [ %21, %19 ]
  %26 = phi float [ %36, %35 ], [ %22, %19 ]
  %27 = phi i32 [ %38, %35 ], [ 0, %19 ]
  %28 = sub nsw i32 %12, %25
  %29 = icmp sgt i32 %28, -1
  br i1 %29, label %30, label %35

30:                                               ; preds = %24
  %31 = zext i32 %28 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fadd contract float %26, %33
  br label %35

35:                                               ; preds = %30, %24
  %36 = phi float [ %34, %30 ], [ %26, %24 ]
  %37 = add nuw nsw i32 %25, 1
  %38 = add i32 %27, 1
  %39 = icmp eq i32 %38, %15
  br i1 %39, label %40, label %24, !llvm.loop !11

40:                                               ; preds = %19, %35, %3
  %41 = phi float [ 0.000000e+00, %3 ], [ %20, %19 ], [ %36, %35 ]
  %42 = sext i32 %12 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  store float %41, float addrspace(1)* %43, align 4, !tbaa !7
  ret void

44:                                               ; preds = %125, %17
  %45 = phi i32 [ 0, %17 ], [ %127, %125 ]
  %46 = phi float [ 0.000000e+00, %17 ], [ %126, %125 ]
  %47 = phi i32 [ 0, %17 ], [ %128, %125 ]
  %48 = sub nsw i32 %12, %45
  %49 = icmp sgt i32 %48, -1
  br i1 %49, label %50, label %55

50:                                               ; preds = %44
  %51 = zext i32 %48 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fadd contract float %46, %53
  br label %55

55:                                               ; preds = %44, %50
  %56 = phi float [ %54, %50 ], [ %46, %44 ]
  %57 = xor i32 %45, -1
  %58 = add i32 %12, %57
  %59 = icmp sgt i32 %58, -1
  br i1 %59, label %60, label %65

60:                                               ; preds = %55
  %61 = zext i32 %58 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fadd contract float %56, %63
  br label %65

65:                                               ; preds = %60, %55
  %66 = phi float [ %64, %60 ], [ %56, %55 ]
  %67 = or i32 %45, 2
  %68 = sub nsw i32 %12, %67
  %69 = icmp sgt i32 %68, -1
  br i1 %69, label %70, label %75

70:                                               ; preds = %65
  %71 = zext i32 %68 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = fadd contract float %66, %73
  br label %75

75:                                               ; preds = %70, %65
  %76 = phi float [ %74, %70 ], [ %66, %65 ]
  %77 = or i32 %45, 3
  %78 = sub nsw i32 %12, %77
  %79 = icmp sgt i32 %78, -1
  br i1 %79, label %80, label %85

80:                                               ; preds = %75
  %81 = zext i32 %78 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = fadd contract float %76, %83
  br label %85

85:                                               ; preds = %80, %75
  %86 = phi float [ %84, %80 ], [ %76, %75 ]
  %87 = or i32 %45, 4
  %88 = sub nsw i32 %12, %87
  %89 = icmp sgt i32 %88, -1
  br i1 %89, label %90, label %95

90:                                               ; preds = %85
  %91 = zext i32 %88 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fadd contract float %86, %93
  br label %95

95:                                               ; preds = %90, %85
  %96 = phi float [ %94, %90 ], [ %86, %85 ]
  %97 = or i32 %45, 5
  %98 = sub nsw i32 %12, %97
  %99 = icmp sgt i32 %98, -1
  br i1 %99, label %100, label %105

100:                                              ; preds = %95
  %101 = zext i32 %98 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = fadd contract float %96, %103
  br label %105

105:                                              ; preds = %100, %95
  %106 = phi float [ %104, %100 ], [ %96, %95 ]
  %107 = or i32 %45, 6
  %108 = sub nsw i32 %12, %107
  %109 = icmp sgt i32 %108, -1
  br i1 %109, label %110, label %115

110:                                              ; preds = %105
  %111 = zext i32 %108 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = fadd contract float %106, %113
  br label %115

115:                                              ; preds = %110, %105
  %116 = phi float [ %114, %110 ], [ %106, %105 ]
  %117 = or i32 %45, 7
  %118 = sub nsw i32 %12, %117
  %119 = icmp sgt i32 %118, -1
  br i1 %119, label %120, label %125

120:                                              ; preds = %115
  %121 = zext i32 %118 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = fadd contract float %116, %123
  br label %125

125:                                              ; preds = %120, %115
  %126 = phi float [ %124, %120 ], [ %116, %115 ]
  %127 = add nuw nsw i32 %45, 8
  %128 = add i32 %47, 8
  %129 = icmp eq i32 %128, %18
  br i1 %129, label %19, label %44, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
