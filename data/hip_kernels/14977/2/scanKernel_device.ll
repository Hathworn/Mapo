; ModuleID = '../data/hip_kernels/14977/2/main.cu'
source_filename = "../data/hip_kernels/14977/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10scanKernelPjS_mE4temp = internal unnamed_addr addrspace(3) global [8 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10scanKernelPjS_m(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = shl i32 %4, 3
  %7 = shl nuw nsw i32 %5, 1
  %8 = add i32 %6, %7
  %9 = or i32 %8, 1
  %10 = sext i32 %9 to i64
  %11 = icmp ult i64 %10, %2
  br i1 %11, label %12, label %20

12:                                               ; preds = %3
  %13 = sext i32 %8 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %8
  store i32 %15, i32 addrspace(3)* %16, align 8, !tbaa !5
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %10
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %9
  store i32 %18, i32 addrspace(3)* %19, align 4, !tbaa !5
  br label %20

20:                                               ; preds = %12, %3
  %21 = add nuw nsw i32 %7, 1
  %22 = add nsw i32 %6, -1
  %23 = add nuw nsw i32 %7, 2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = icmp ult i32 %5, 4
  br i1 %24, label %25, label %33

25:                                               ; preds = %20
  %26 = add i32 %6, %7
  %27 = add i32 %22, %23
  %28 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %26
  %29 = load i32, i32 addrspace(3)* %28, align 8, !tbaa !5
  %30 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %27
  %31 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !5
  %32 = add i32 %31, %29
  store i32 %32, i32 addrspace(3)* %30, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %25, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp ult i32 %5, 2
  br i1 %34, label %35, label %45

35:                                               ; preds = %33
  %36 = shl nuw nsw i32 %21, 1
  %37 = add i32 %22, %36
  %38 = shl nuw nsw i32 %23, 1
  %39 = add i32 %22, %38
  %40 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %37
  %41 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %42 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %39
  %43 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %44 = add i32 %43, %41
  store i32 %44, i32 addrspace(3)* %42, align 4, !tbaa !5
  br label %45

45:                                               ; preds = %35, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp eq i32 %5, 0
  br i1 %46, label %47, label %57

47:                                               ; preds = %45
  %48 = shl nuw nsw i32 %21, 2
  %49 = add i32 %22, %48
  %50 = shl nuw nsw i32 %23, 2
  %51 = add i32 %22, %50
  %52 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %49
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %54 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %51
  %55 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !5
  %56 = add i32 %55, %53
  store i32 %56, i32 addrspace(3)* %54, align 4, !tbaa !5
  br label %57

57:                                               ; preds = %47, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = icmp eq i32 %5, 0
  br i1 %58, label %59, label %62

59:                                               ; preds = %57
  %60 = add nuw nsw i32 %6, 7
  %61 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %60
  store i32 0, i32 addrspace(3)* %61, align 4, !tbaa !5
  br label %62

62:                                               ; preds = %59, %57
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %63, label %73

63:                                               ; preds = %62
  %64 = shl nuw nsw i32 %21, 2
  %65 = add i32 %22, %64
  %66 = shl nuw nsw i32 %23, 2
  %67 = add i32 %22, %66
  %68 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %65
  %69 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !5
  %70 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %67
  %71 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !5
  store i32 %71, i32 addrspace(3)* %68, align 4, !tbaa !5
  %72 = add i32 %71, %69
  store i32 %72, i32 addrspace(3)* %70, align 4, !tbaa !5
  br label %73

73:                                               ; preds = %62, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %74, label %84

74:                                               ; preds = %73
  %75 = shl nuw nsw i32 %21, 1
  %76 = add i32 %22, %75
  %77 = shl nuw nsw i32 %23, 1
  %78 = add i32 %22, %77
  %79 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %76
  %80 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !5
  %81 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %78
  %82 = load i32, i32 addrspace(3)* %81, align 4, !tbaa !5
  store i32 %82, i32 addrspace(3)* %79, align 4, !tbaa !5
  %83 = add i32 %82, %80
  store i32 %83, i32 addrspace(3)* %81, align 4, !tbaa !5
  br label %84

84:                                               ; preds = %74, %73
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %24, label %85, label %93

85:                                               ; preds = %84
  %86 = add i32 %6, %7
  %87 = add i32 %22, %23
  %88 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %86
  %89 = load i32, i32 addrspace(3)* %88, align 8, !tbaa !5
  %90 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %87
  %91 = load i32, i32 addrspace(3)* %90, align 4, !tbaa !5
  store i32 %91, i32 addrspace(3)* %88, align 8, !tbaa !5
  %92 = add i32 %91, %89
  store i32 %92, i32 addrspace(3)* %90, align 4, !tbaa !5
  br label %93

93:                                               ; preds = %85, %84
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %11, label %94, label %102

94:                                               ; preds = %93
  %95 = sext i32 %8 to i64
  %96 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %8
  %97 = load i32, i32 addrspace(3)* %96, align 8, !tbaa !5
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  store i32 %97, i32 addrspace(1)* %98, align 4, !tbaa !5
  %99 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ10scanKernelPjS_mE4temp, i32 0, i32 %9
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !5
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %10
  store i32 %100, i32 addrspace(1)* %101, align 4, !tbaa !5
  br label %102

102:                                              ; preds = %94, %93
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
