; ModuleID = '../data/hip_kernels/5511/7/main.cu'
source_filename = "../data/hip_kernels/5511/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13evovle_kerneliPcS_PiS0_(i32 %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add nuw nsw i32 %13, 1
  %15 = add i32 %14, %12
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = add i32 %23, 1
  %25 = add nsw i32 %0, 2
  %26 = mul nsw i32 %15, %25
  %27 = add nsw i32 %24, %26
  %28 = icmp sgt i32 %15, %0
  %29 = icmp sgt i32 %24, %0
  %30 = select i1 %28, i1 true, i1 %29
  br i1 %30, label %104, label %31

31:                                               ; preds = %5
  %32 = add nsw i32 %27, %25
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !7, !amdgpu.noclobber !5
  %36 = sext i8 %35 to i32
  %37 = sub nsw i32 %27, %25
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7, !amdgpu.noclobber !5
  %41 = sext i8 %40 to i32
  %42 = add nsw i32 %41, %36
  %43 = add nsw i32 %27, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %44
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !7, !amdgpu.noclobber !5
  %47 = sext i8 %46 to i32
  %48 = add nsw i32 %42, %47
  %49 = add i32 %26, %23
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !5
  %53 = sext i8 %52 to i32
  %54 = add nsw i32 %48, %53
  %55 = add nsw i32 %0, 3
  %56 = add nsw i32 %27, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !7, !amdgpu.noclobber !5
  %60 = sext i8 %59 to i32
  %61 = add nsw i32 %54, %60
  %62 = sub nsw i32 %27, %55
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7, !amdgpu.noclobber !5
  %66 = sext i8 %65 to i32
  %67 = add nsw i32 %61, %66
  %68 = add nsw i32 %0, 1
  %69 = sub nsw i32 %27, %68
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7, !amdgpu.noclobber !5
  %73 = sext i8 %72 to i32
  %74 = add nsw i32 %67, %73
  %75 = add nsw i32 %27, %68
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %76
  %78 = load i8, i8 addrspace(1)* %77, align 1, !tbaa !7, !amdgpu.noclobber !5
  %79 = sext i8 %78 to i32
  %80 = add nsw i32 %74, %79
  %81 = sext i32 %27 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %81
  %83 = icmp eq i32 %80, 3
  br i1 %83, label %89, label %84

84:                                               ; preds = %31
  %85 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !7, !amdgpu.noclobber !5
  %86 = icmp eq i32 %80, 2
  %87 = icmp ne i8 %85, 0
  %88 = select i1 %86, i1 %87, i1 false
  br label %89

89:                                               ; preds = %84, %31
  %90 = phi i1 [ true, %31 ], [ %88, %84 ]
  %91 = zext i1 %90 to i8
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %81
  store i8 %91, i8 addrspace(1)* %92, align 1, !tbaa !7
  br i1 %90, label %93, label %97

93:                                               ; preds = %89
  %94 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !10
  %95 = add nsw i32 %94, 1
  store i32 %95, i32 addrspace(1)* %3, align 4, !tbaa !10
  %96 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !7
  br label %97

97:                                               ; preds = %93, %89
  %98 = phi i8 [ %96, %93 ], [ 0, %89 ]
  %99 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !7
  %100 = icmp eq i8 %98, %99
  br i1 %100, label %104, label %101

101:                                              ; preds = %97
  %102 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !10
  %103 = add nsw i32 %102, 1
  store i32 %103, i32 addrspace(1)* %4, align 4, !tbaa !10
  br label %104

104:                                              ; preds = %97, %101, %5
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
