; ModuleID = '../data/hip_kernels/10749/0/main.cu'
source_filename = "../data/hip_kernels/10749/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23matrixMultKernel_globalPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %151

25:                                               ; preds = %4
  %26 = icmp sgt i32 %3, 0
  %27 = mul nsw i32 %13, %3
  %28 = sext i32 %27 to i64
  br i1 %26, label %31, label %29

29:                                               ; preds = %25
  %30 = sext i32 %21 to i64
  br label %60

31:                                               ; preds = %25
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %33 = sext i32 %21 to i64
  %34 = getelementptr float, float addrspace(1)* %1, i64 %33
  %35 = and i32 %3, 7
  %36 = icmp ult i32 %3, 8
  br i1 %36, label %39, label %37

37:                                               ; preds = %31
  %38 = and i32 %3, -8
  br label %65

39:                                               ; preds = %65, %31
  %40 = phi float [ undef, %31 ], [ %147, %65 ]
  %41 = phi i32 [ 0, %31 ], [ %148, %65 ]
  %42 = phi float [ 0.000000e+00, %31 ], [ %147, %65 ]
  %43 = icmp eq i32 %35, 0
  br i1 %43, label %60, label %44

44:                                               ; preds = %39, %44
  %45 = phi i32 [ %57, %44 ], [ %41, %39 ]
  %46 = phi float [ %56, %44 ], [ %42, %39 ]
  %47 = phi i32 [ %58, %44 ], [ 0, %39 ]
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %32, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = mul nsw i32 %45, %3
  %52 = sext i32 %51 to i64
  %53 = getelementptr float, float addrspace(1)* %34, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fmul contract float %50, %54
  %56 = fadd contract float %46, %55
  %57 = add nuw nsw i32 %45, 1
  %58 = add i32 %47, 1
  %59 = icmp eq i32 %58, %35
  br i1 %59, label %60, label %44, !llvm.loop !11

60:                                               ; preds = %39, %44, %29
  %61 = phi i64 [ %30, %29 ], [ %33, %44 ], [ %33, %39 ]
  %62 = phi float [ 0.000000e+00, %29 ], [ %40, %39 ], [ %56, %44 ]
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %64 = getelementptr inbounds float, float addrspace(1)* %63, i64 %61
  store float %62, float addrspace(1)* %64, align 4, !tbaa !7
  br label %151

65:                                               ; preds = %65, %37
  %66 = phi i32 [ 0, %37 ], [ %148, %65 ]
  %67 = phi float [ 0.000000e+00, %37 ], [ %147, %65 ]
  %68 = phi i32 [ 0, %37 ], [ %149, %65 ]
  %69 = zext i32 %66 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %32, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = mul nsw i32 %66, %3
  %73 = sext i32 %72 to i64
  %74 = getelementptr float, float addrspace(1)* %34, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fmul contract float %71, %75
  %77 = fadd contract float %67, %76
  %78 = or i32 %66, 1
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %32, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = mul nsw i32 %78, %3
  %83 = sext i32 %82 to i64
  %84 = getelementptr float, float addrspace(1)* %34, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = fmul contract float %81, %85
  %87 = fadd contract float %77, %86
  %88 = or i32 %66, 2
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %32, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = mul nsw i32 %88, %3
  %93 = sext i32 %92 to i64
  %94 = getelementptr float, float addrspace(1)* %34, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = fmul contract float %91, %95
  %97 = fadd contract float %87, %96
  %98 = or i32 %66, 3
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %32, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = mul nsw i32 %98, %3
  %103 = sext i32 %102 to i64
  %104 = getelementptr float, float addrspace(1)* %34, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fmul contract float %101, %105
  %107 = fadd contract float %97, %106
  %108 = or i32 %66, 4
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %32, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = mul nsw i32 %108, %3
  %113 = sext i32 %112 to i64
  %114 = getelementptr float, float addrspace(1)* %34, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fmul contract float %111, %115
  %117 = fadd contract float %107, %116
  %118 = or i32 %66, 5
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %32, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = mul nsw i32 %118, %3
  %123 = sext i32 %122 to i64
  %124 = getelementptr float, float addrspace(1)* %34, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = fmul contract float %121, %125
  %127 = fadd contract float %117, %126
  %128 = or i32 %66, 6
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %32, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = mul nsw i32 %128, %3
  %133 = sext i32 %132 to i64
  %134 = getelementptr float, float addrspace(1)* %34, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !5
  %136 = fmul contract float %131, %135
  %137 = fadd contract float %127, %136
  %138 = or i32 %66, 7
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %32, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !5
  %142 = mul nsw i32 %138, %3
  %143 = sext i32 %142 to i64
  %144 = getelementptr float, float addrspace(1)* %34, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = fmul contract float %141, %145
  %147 = fadd contract float %137, %146
  %148 = add nuw nsw i32 %66, 8
  %149 = add i32 %68, 8
  %150 = icmp eq i32 %149, %38
  br i1 %150, label %39, label %65, !llvm.loop !13

151:                                              ; preds = %4, %60
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
