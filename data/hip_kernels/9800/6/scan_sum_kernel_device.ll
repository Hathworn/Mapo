; ModuleID = '../data/hip_kernels/9800/6/main.cu'
source_filename = "../data/hip_kernels/9800/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15scan_sum_kernelPjjS_S_jjE17shared_input_vals = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16
@_ZZ15scan_sum_kernelPjjS_S_jjE13shared_output = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15scan_sum_kernelPjjS_S_jj(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = icmp ult i32 %15, %4
  br i1 %16, label %17, label %21

17:                                               ; preds = %6
  %18 = zext i32 %15 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %21

21:                                               ; preds = %6, %17
  %22 = phi i32 [ %20, %17 ], [ -1, %6 ]
  %23 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ15scan_sum_kernelPjjS_S_jjE17shared_input_vals, i32 0, i32 %7
  store i32 %22, i32 addrspace(3)* %23, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = icmp eq i32 %7, 0
  br i1 %24, label %32, label %25

25:                                               ; preds = %21
  %26 = add nsw i32 %7, -1
  %27 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ15scan_sum_kernelPjjS_S_jjE17shared_input_vals, i32 0, i32 %26
  %28 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !7
  %29 = xor i32 %28, -1
  %30 = lshr i32 %29, %1
  %31 = and i32 %30, 1
  br label %32

32:                                               ; preds = %25, %21
  %33 = phi i32 [ 0, %21 ], [ %31, %25 ]
  %34 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ15scan_sum_kernelPjjS_S_jjE13shared_output, i32 0, i32 %7
  store i32 %33, i32 addrspace(3)* %34, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ15scan_sum_kernelPjjS_S_jjE13shared_output, i32 0, i32 %7
  %36 = icmp eq i32 %7, 0
  br i1 %36, label %41, label %37

37:                                               ; preds = %32
  %38 = add nsw i32 %7, -1
  %39 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ15scan_sum_kernelPjjS_S_jjE13shared_output, i32 0, i32 %38
  %40 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !7
  br label %41

41:                                               ; preds = %37, %32
  %42 = phi i32 [ %40, %37 ], [ 0, %32 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !7
  %44 = add i32 %43, %42
  store i32 %44, i32 addrspace(3)* %35, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp ult i32 %7, 2
  br i1 %45, label %50, label %46

46:                                               ; preds = %41
  %47 = add nsw i32 %7, -2
  %48 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ15scan_sum_kernelPjjS_S_jjE13shared_output, i32 0, i32 %47
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %46, %41
  %51 = phi i32 [ %49, %46 ], [ 0, %41 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !7
  %53 = add i32 %52, %51
  store i32 %53, i32 addrspace(3)* %35, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp ult i32 %7, 4
  br i1 %54, label %59, label %55

55:                                               ; preds = %50
  %56 = add nsw i32 %7, -4
  %57 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ15scan_sum_kernelPjjS_S_jjE13shared_output, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %55, %50
  %60 = phi i32 [ %58, %55 ], [ 0, %50 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !7
  %62 = add i32 %61, %60
  store i32 %62, i32 addrspace(3)* %35, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ult i32 %7, 8
  br i1 %63, label %68, label %64

64:                                               ; preds = %59
  %65 = add nsw i32 %7, -8
  %66 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ15scan_sum_kernelPjjS_S_jjE13shared_output, i32 0, i32 %65
  %67 = load i32, i32 addrspace(3)* %66, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %64, %59
  %69 = phi i32 [ %67, %64 ], [ 0, %59 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !7
  %71 = add i32 %70, %69
  store i32 %71, i32 addrspace(3)* %35, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = icmp ult i32 %7, 16
  br i1 %72, label %77, label %73

73:                                               ; preds = %68
  %74 = add nsw i32 %7, -16
  %75 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ15scan_sum_kernelPjjS_S_jjE13shared_output, i32 0, i32 %74
  %76 = load i32, i32 addrspace(3)* %75, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %73, %68
  %78 = phi i32 [ %76, %73 ], [ 0, %68 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !7
  %80 = add i32 %79, %78
  store i32 %80, i32 addrspace(3)* %35, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %16, label %81, label %98

81:                                               ; preds = %77
  %82 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !7
  %83 = zext i32 %15 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %83
  store i32 %82, i32 addrspace(1)* %84, align 4, !tbaa !7
  %85 = add i32 %4, -1
  %86 = icmp eq i32 %15, %85
  %87 = icmp eq i32 %7, 31
  %88 = or i1 %87, %86
  br i1 %88, label %89, label %98

89:                                               ; preds = %81
  %90 = zext i32 %8 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %90
  store i32 %82, i32 addrspace(1)* %91, align 4, !tbaa !7
  %92 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !7
  %93 = shl nuw i32 1, %1
  %94 = and i32 %92, %93
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %98

96:                                               ; preds = %89
  %97 = add i32 %82, 1
  store i32 %97, i32 addrspace(1)* %91, align 4, !tbaa !7
  br label %98

98:                                               ; preds = %81, %96, %89, %77
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
