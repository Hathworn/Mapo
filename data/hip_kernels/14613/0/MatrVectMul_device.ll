; ModuleID = '../data/hip_kernels/14613/0/main.cu'
source_filename = "../data/hip_kernels/14613/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11MatrVectMulPiS_S_(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, 15000
  br i1 %13, label %14, label %131

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  store i32 0, i32 addrspace(1)* %16, align 4, !tbaa !7
  br label %17

17:                                               ; preds = %17, %14
  %18 = phi i32 [ 0, %14 ], [ %128, %17 ]
  %19 = phi i32 [ 0, %14 ], [ %129, %17 ]
  %20 = mul nuw nsw i32 %19, 15000
  %21 = add nsw i32 %20, %12
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7
  %25 = zext i32 %19 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7
  %28 = mul nsw i32 %27, %24
  %29 = add nsw i32 %18, %28
  store i32 %29, i32 addrspace(1)* %16, align 4, !tbaa !7
  %30 = or i32 %19, 1
  %31 = mul nuw nsw i32 %30, 15000
  %32 = add nsw i32 %31, %12
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %36 = zext i32 %30 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = mul nsw i32 %38, %35
  %40 = add nsw i32 %29, %39
  store i32 %40, i32 addrspace(1)* %16, align 4, !tbaa !7
  %41 = add nuw nsw i32 %19, 2
  %42 = mul nuw nsw i32 %41, 15000
  %43 = add nsw i32 %42, %12
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %47 = zext i32 %41 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7
  %50 = mul nsw i32 %49, %46
  %51 = add nsw i32 %40, %50
  store i32 %51, i32 addrspace(1)* %16, align 4, !tbaa !7
  %52 = add nuw nsw i32 %19, 3
  %53 = mul nuw nsw i32 %52, 15000
  %54 = add nsw i32 %53, %12
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7
  %58 = zext i32 %52 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7
  %61 = mul nsw i32 %60, %57
  %62 = add nsw i32 %51, %61
  store i32 %62, i32 addrspace(1)* %16, align 4, !tbaa !7
  %63 = add nuw nsw i32 %19, 4
  %64 = mul nuw nsw i32 %63, 15000
  %65 = add nsw i32 %64, %12
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7
  %69 = zext i32 %63 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7
  %72 = mul nsw i32 %71, %68
  %73 = add nsw i32 %62, %72
  store i32 %73, i32 addrspace(1)* %16, align 4, !tbaa !7
  %74 = add nuw nsw i32 %19, 5
  %75 = mul nuw nsw i32 %74, 15000
  %76 = add nsw i32 %75, %12
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7
  %80 = zext i32 %74 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7
  %83 = mul nsw i32 %82, %79
  %84 = add nsw i32 %73, %83
  store i32 %84, i32 addrspace(1)* %16, align 4, !tbaa !7
  %85 = add nuw nsw i32 %19, 6
  %86 = mul nuw nsw i32 %85, 15000
  %87 = add nsw i32 %86, %12
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7
  %91 = zext i32 %85 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7
  %94 = mul nsw i32 %93, %90
  %95 = add nsw i32 %84, %94
  store i32 %95, i32 addrspace(1)* %16, align 4, !tbaa !7
  %96 = add nuw nsw i32 %19, 7
  %97 = mul nuw nsw i32 %96, 15000
  %98 = add nsw i32 %97, %12
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7
  %102 = zext i32 %96 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %102
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !7
  %105 = mul nsw i32 %104, %101
  %106 = add nsw i32 %95, %105
  store i32 %106, i32 addrspace(1)* %16, align 4, !tbaa !7
  %107 = add nuw nsw i32 %19, 8
  %108 = mul nuw nsw i32 %107, 15000
  %109 = add nsw i32 %108, %12
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !7
  %113 = zext i32 %107 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !7
  %116 = mul nsw i32 %115, %112
  %117 = add nsw i32 %106, %116
  store i32 %117, i32 addrspace(1)* %16, align 4, !tbaa !7
  %118 = add nuw nsw i32 %19, 9
  %119 = mul nuw nsw i32 %118, 15000
  %120 = add nsw i32 %119, %12
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !7
  %124 = zext i32 %118 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !7
  %127 = mul nsw i32 %126, %123
  %128 = add nsw i32 %117, %127
  store i32 %128, i32 addrspace(1)* %16, align 4, !tbaa !7
  %129 = add nuw nsw i32 %19, 10
  %130 = icmp eq i32 %129, 15000
  br i1 %130, label %131, label %17, !llvm.loop !11

131:                                              ; preds = %17, %3
  ret void
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
