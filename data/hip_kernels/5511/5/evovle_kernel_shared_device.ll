; ModuleID = '../data/hip_kernels/5511/5/main.cu'
source_filename = "../data/hip_kernels/5511/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared = internal unnamed_addr addrspace(3) global [16 x [16 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z20evovle_kernel_sharediPcS_PiS0_(i32 %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = add nsw i32 %11, -2
  %13 = mul i32 %12, %7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = add nsw i32 %20, -2
  %22 = mul i32 %21, %16
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = add nsw i32 %0, 2
  %26 = mul nsw i32 %15, %25
  %27 = add nsw i32 %26, %24
  %28 = add nsw i32 %0, 1
  %29 = icmp sgt i32 %15, %28
  %30 = icmp sgt i32 %24, %28
  %31 = select i1 %29, i1 true, i1 %30
  br i1 %31, label %37, label %32

32:                                               ; preds = %5
  %33 = sext i32 %27 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !7, !amdgpu.noclobber !5
  %36 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %14, i32 %23
  store i8 %35, i8 addrspace(3)* %36, align 1, !tbaa !7
  br label %37

37:                                               ; preds = %32, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp sgt i32 %15, %0
  br i1 %38, label %111, label %39

39:                                               ; preds = %37
  %40 = icmp sle i32 %24, %0
  %41 = icmp ne i32 %14, 0
  %42 = select i1 %40, i1 %41, i1 false
  br i1 %42, label %43, label %111

43:                                               ; preds = %39
  %44 = add nsw i32 %20, -1
  %45 = icmp eq i32 %14, %44
  %46 = icmp eq i32 %23, 0
  %47 = select i1 %45, i1 true, i1 %46
  %48 = add nsw i32 %11, -1
  %49 = icmp eq i32 %23, %48
  %50 = select i1 %47, i1 true, i1 %49
  br i1 %50, label %111, label %51

51:                                               ; preds = %43
  %52 = add nuw nsw i32 %14, 1
  %53 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %52, i32 %23
  %54 = load i8, i8 addrspace(3)* %53, align 1, !tbaa !7
  %55 = sext i8 %54 to i32
  %56 = add nsw i32 %14, -1
  %57 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %56, i32 %23
  %58 = load i8, i8 addrspace(3)* %57, align 1, !tbaa !7
  %59 = sext i8 %58 to i32
  %60 = add nsw i32 %59, %55
  %61 = add nuw nsw i32 %23, 1
  %62 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %14, i32 %61
  %63 = load i8, i8 addrspace(3)* %62, align 1, !tbaa !7
  %64 = sext i8 %63 to i32
  %65 = add nsw i32 %60, %64
  %66 = add nsw i32 %23, -1
  %67 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %14, i32 %66
  %68 = load i8, i8 addrspace(3)* %67, align 1, !tbaa !7
  %69 = sext i8 %68 to i32
  %70 = add nsw i32 %65, %69
  %71 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %52, i32 %61
  %72 = load i8, i8 addrspace(3)* %71, align 1, !tbaa !7
  %73 = sext i8 %72 to i32
  %74 = add nsw i32 %70, %73
  %75 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %56, i32 %66
  %76 = load i8, i8 addrspace(3)* %75, align 1, !tbaa !7
  %77 = sext i8 %76 to i32
  %78 = add nsw i32 %74, %77
  %79 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %56, i32 %61
  %80 = load i8, i8 addrspace(3)* %79, align 1, !tbaa !7
  %81 = sext i8 %80 to i32
  %82 = add nsw i32 %78, %81
  %83 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %52, i32 %66
  %84 = load i8, i8 addrspace(3)* %83, align 1, !tbaa !7
  %85 = sext i8 %84 to i32
  %86 = add nsw i32 %82, %85
  %87 = icmp eq i32 %86, 3
  br i1 %87, label %94, label %88

88:                                               ; preds = %51
  %89 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]] addrspace(3)* @_ZZ20evovle_kernel_sharediPcS_PiS0_E13oldGen_shared, i32 0, i32 %14, i32 %23
  %90 = load i8, i8 addrspace(3)* %89, align 1, !tbaa !7
  %91 = icmp eq i32 %86, 2
  %92 = icmp ne i8 %90, 0
  %93 = select i1 %91, i1 %92, i1 false
  br label %94

94:                                               ; preds = %88, %51
  %95 = phi i1 [ true, %51 ], [ %93, %88 ]
  %96 = zext i1 %95 to i8
  %97 = sext i32 %27 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %97
  store i8 %96, i8 addrspace(1)* %98, align 1, !tbaa !7
  br i1 %95, label %99, label %103

99:                                               ; preds = %94
  %100 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !10
  %101 = add nsw i32 %100, 1
  store i32 %101, i32 addrspace(1)* %3, align 4, !tbaa !10
  %102 = load i8, i8 addrspace(1)* %98, align 1, !tbaa !7
  br label %103

103:                                              ; preds = %99, %94
  %104 = phi i8 [ %102, %99 ], [ 0, %94 ]
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %97
  %106 = load i8, i8 addrspace(1)* %105, align 1, !tbaa !7
  %107 = icmp eq i8 %104, %106
  br i1 %107, label %111, label %108

108:                                              ; preds = %103
  %109 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !10
  %110 = add nsw i32 %109, 1
  store i32 %110, i32 addrspace(1)* %4, align 4, !tbaa !10
  br label %111

111:                                              ; preds = %103, %108, %43, %39, %37
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
