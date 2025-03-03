; ModuleID = '../data/hip_kernels/4879/0/main.cu'
source_filename = "../data/hip_kernels/4879/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10maxpoolingPfPKfii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sdiv i32 %2, 2
  %15 = freeze i32 %13
  %16 = freeze i32 %14
  %17 = sdiv i32 %15, %16
  %18 = mul i32 %17, %16
  %19 = sub i32 %15, %18
  %20 = shl nsw i32 %19, 1
  %21 = shl i32 %2, 1
  %22 = mul i32 %21, %17
  %23 = add nsw i32 %22, %20
  %24 = icmp sgt i32 %3, 0
  br i1 %24, label %25, label %69

25:                                               ; preds = %4
  %26 = mul nsw i32 %23, %3
  %27 = or i32 %23, 1
  %28 = mul nsw i32 %27, %3
  %29 = add nsw i32 %23, %2
  %30 = mul nsw i32 %29, %3
  %31 = add nsw i32 %29, 1
  %32 = mul nsw i32 %31, %3
  %33 = mul nsw i32 %13, %3
  %34 = and i32 %3, 1
  %35 = icmp eq i32 %3, 1
  br i1 %35, label %38, label %36

36:                                               ; preds = %25
  %37 = and i32 %3, -2
  br label %70

38:                                               ; preds = %70, %25
  %39 = phi i32 [ 0, %25 ], [ %128, %70 ]
  %40 = icmp eq i32 %34, 0
  br i1 %40, label %69, label %41

41:                                               ; preds = %38
  %42 = add nsw i32 %39, %26
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = fcmp contract ogt float %45, 0.000000e+00
  %47 = select i1 %46, float %45, float 0.000000e+00
  %48 = add nsw i32 %39, %28
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7
  %52 = fcmp contract olt float %47, %51
  %53 = select i1 %52, float %51, float %47
  %54 = add nsw i32 %39, %30
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = fcmp contract olt float %53, %57
  %59 = select i1 %58, float %57, float %53
  %60 = add nsw i32 %39, %32
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7
  %64 = fcmp contract olt float %59, %63
  %65 = select i1 %64, float %63, float %59
  %66 = add nsw i32 %39, %33
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  store float %65, float addrspace(1)* %68, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %41, %38, %4
  ret void

70:                                               ; preds = %70, %36
  %71 = phi i32 [ 0, %36 ], [ %128, %70 ]
  %72 = phi i32 [ 0, %36 ], [ %129, %70 ]
  %73 = add nsw i32 %71, %26
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fcmp contract ogt float %76, 0.000000e+00
  %78 = select i1 %77, float %76, float 0.000000e+00
  %79 = add nsw i32 %71, %28
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fcmp contract olt float %78, %82
  %84 = select i1 %83, float %82, float %78
  %85 = add nsw i32 %71, %30
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fcmp contract olt float %84, %88
  %90 = select i1 %89, float %88, float %84
  %91 = add nsw i32 %71, %32
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = fcmp contract olt float %90, %94
  %96 = select i1 %95, float %94, float %90
  %97 = add nsw i32 %71, %33
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  store float %96, float addrspace(1)* %99, align 4, !tbaa !7
  %100 = or i32 %71, 1
  %101 = add nsw i32 %100, %26
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = fcmp contract ogt float %104, 0.000000e+00
  %106 = select i1 %105, float %104, float 0.000000e+00
  %107 = add nsw i32 %100, %28
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = fcmp contract olt float %106, %110
  %112 = select i1 %111, float %110, float %106
  %113 = add nsw i32 %100, %30
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fcmp contract olt float %112, %116
  %118 = select i1 %117, float %116, float %112
  %119 = add nsw i32 %100, %32
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fcmp contract olt float %118, %122
  %124 = select i1 %123, float %122, float %118
  %125 = add nsw i32 %100, %33
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  store float %124, float addrspace(1)* %127, align 4, !tbaa !7
  %128 = add nuw nsw i32 %71, 2
  %129 = add i32 %72, 2
  %130 = icmp eq i32 %129, %37
  br i1 %130, label %38, label %70, !llvm.loop !11
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
!12 = !{!"llvm.loop.mustprogress"}
