; ModuleID = '../data/hip_kernels/13520/8/main.cu'
source_filename = "../data/hip_kernels/13520/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6EvolvePiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp sgt i32 %12, 0
  br i1 %21, label %22, label %88

22:                                               ; preds = %3
  %23 = add nsw i32 %2, -1
  %24 = icmp slt i32 %12, %23
  %25 = icmp sgt i32 %20, 0
  %26 = select i1 %24, i1 %25, i1 false
  %27 = icmp slt i32 %20, %23
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %88

29:                                               ; preds = %22
  %30 = mul nsw i32 %12, %2
  %31 = add nsw i32 %30, %20
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = add nsw i32 %12, -1
  %36 = mul nsw i32 %35, %2
  %37 = add nsw i32 %36, %20
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = add nsw i32 %37, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = add nsw i32 %31, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = add nuw nsw i32 %12, 1
  %50 = mul nsw i32 %49, %2
  %51 = add nsw i32 %50, %20
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = sext i32 %51 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = add nsw i32 %51, -1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = add nsw i32 %31, -1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = add nsw i32 %37, -1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = add nsw i32 %44, %40
  %72 = add nsw i32 %71, %48
  %73 = add nsw i32 %72, %55
  %74 = add nsw i32 %73, %58
  %75 = add nsw i32 %74, %62
  %76 = add nsw i32 %75, %66
  %77 = add nsw i32 %76, %70
  %78 = icmp eq i32 %77, 3
  br i1 %78, label %85, label %79

79:                                               ; preds = %29
  %80 = icmp eq i32 %34, 1
  %81 = and i32 %77, -2
  %82 = icmp eq i32 %81, 2
  %83 = zext i1 %82 to i32
  %84 = select i1 %80, i32 %83, i32 %34
  br label %85

85:                                               ; preds = %79, %29
  %86 = phi i32 [ 1, %29 ], [ %84, %79 ]
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %32
  store i32 %86, i32 addrspace(1)* %87, align 4, !tbaa !7
  br label %88

88:                                               ; preds = %85, %22, %3
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
