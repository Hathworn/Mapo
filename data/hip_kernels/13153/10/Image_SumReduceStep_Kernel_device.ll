; ModuleID = '../data/hip_kernels/13153/10/main.cu'
source_filename = "../data/hip_kernels/13153/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem = internal unnamed_addr addrspace(3) global [4096 x i8] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z26Image_SumReduceStep_KernelPiS_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 9
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = add i32 %5, %6
  %8 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem to i32 addrspace(3)*), i32 %6
  %9 = add nuw nsw i32 %6, 256
  %10 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem to i32 addrspace(3)*), i32 %9
  store i32 0, i32 addrspace(3)* %10, align 4, !tbaa !5
  %11 = getelementptr inbounds i32, i32 addrspace(3)* bitcast (i8 addrspace(3)* getelementptr inbounds ([4096 x i8], [4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem, i32 0, i32 512) to i32 addrspace(3)*), i32 %6
  store i32 0, i32 addrspace(3)* %11, align 4, !tbaa !5
  %12 = getelementptr inbounds i32, i32 addrspace(3)* bitcast (i8 addrspace(3)* getelementptr inbounds ([4096 x i8], [4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem, i32 0, i32 512) to i32 addrspace(3)*), i32 %9
  store i32 0, i32 addrspace(3)* %12, align 4, !tbaa !5
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !9
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !18, !invariant.load !19
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, -1
  %26 = add i32 %25, %24
  %27 = icmp eq i32 %4, %26
  br i1 %27, label %28, label %39

28:                                               ; preds = %3
  %29 = icmp slt i32 %9, %2
  br i1 %29, label %34, label %30

30:                                               ; preds = %28
  %31 = add nsw i32 %7, 256
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  store i32 0, i32 addrspace(1)* %33, align 4, !tbaa !5
  br label %34

34:                                               ; preds = %30, %28
  %35 = icmp slt i32 %6, %2
  br i1 %35, label %39, label %36

36:                                               ; preds = %34
  %37 = sext i32 %7 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  store i32 0, i32 addrspace(1)* %38, align 4, !tbaa !5
  br label %39

39:                                               ; preds = %34, %36, %3
  %40 = sext i32 %7 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !5
  %43 = add nsw i32 %7, 256
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !5
  %47 = add nsw i32 %46, %42
  store i32 %47, i32 addrspace(3)* %8, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ult i32 %6, 128
  br i1 %48, label %49, label %55

49:                                               ; preds = %39
  %50 = load i32, i32 addrspace(3)* %8, align 4, !tbaa !5
  %51 = add nuw nsw i32 %6, 128
  %52 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem to i32 addrspace(3)*), i32 %51
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %54 = add nsw i32 %53, %50
  store i32 %54, i32 addrspace(3)* %11, align 4, !tbaa !5
  br label %55

55:                                               ; preds = %49, %39
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ult i32 %6, 64
  br i1 %56, label %57, label %63

57:                                               ; preds = %55
  %58 = load i32, i32 addrspace(3)* %11, align 4, !tbaa !5
  %59 = add nuw nsw i32 %6, 64
  %60 = getelementptr inbounds i32, i32 addrspace(3)* bitcast (i8 addrspace(3)* getelementptr inbounds ([4096 x i8], [4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem, i32 0, i32 512) to i32 addrspace(3)*), i32 %59
  %61 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !5
  %62 = add nsw i32 %61, %58
  store i32 %62, i32 addrspace(3)* %8, align 4, !tbaa !5
  br label %63

63:                                               ; preds = %57, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = icmp ult i32 %6, 32
  br i1 %64, label %65, label %71

65:                                               ; preds = %63
  %66 = load i32, i32 addrspace(3)* %8, align 4, !tbaa !5
  %67 = add nuw nsw i32 %6, 32
  %68 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem to i32 addrspace(3)*), i32 %67
  %69 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !5
  %70 = add nsw i32 %69, %66
  store i32 %70, i32 addrspace(3)* %11, align 4, !tbaa !5
  br label %71

71:                                               ; preds = %65, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = icmp ult i32 %6, 16
  br i1 %72, label %73, label %79

73:                                               ; preds = %71
  %74 = load i32, i32 addrspace(3)* %11, align 4, !tbaa !5
  %75 = add nuw nsw i32 %6, 16
  %76 = getelementptr inbounds i32, i32 addrspace(3)* bitcast (i8 addrspace(3)* getelementptr inbounds ([4096 x i8], [4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem, i32 0, i32 512) to i32 addrspace(3)*), i32 %75
  %77 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !5
  %78 = add nsw i32 %77, %74
  store i32 %78, i32 addrspace(3)* %8, align 4, !tbaa !5
  br label %79

79:                                               ; preds = %73, %71
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = icmp ult i32 %6, 8
  br i1 %80, label %81, label %87

81:                                               ; preds = %79
  %82 = load i32, i32 addrspace(3)* %8, align 4, !tbaa !5
  %83 = add nuw nsw i32 %6, 8
  %84 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem to i32 addrspace(3)*), i32 %83
  %85 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !5
  %86 = add nsw i32 %85, %82
  store i32 %86, i32 addrspace(3)* %11, align 4, !tbaa !5
  br label %87

87:                                               ; preds = %81, %79
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %88 = icmp ult i32 %6, 4
  br i1 %88, label %89, label %95

89:                                               ; preds = %87
  %90 = load i32, i32 addrspace(3)* %11, align 4, !tbaa !5
  %91 = add nuw nsw i32 %6, 4
  %92 = getelementptr inbounds i32, i32 addrspace(3)* bitcast (i8 addrspace(3)* getelementptr inbounds ([4096 x i8], [4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem, i32 0, i32 512) to i32 addrspace(3)*), i32 %91
  %93 = load i32, i32 addrspace(3)* %92, align 4, !tbaa !5
  %94 = add nsw i32 %93, %90
  store i32 %94, i32 addrspace(3)* %8, align 4, !tbaa !5
  br label %95

95:                                               ; preds = %89, %87
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = icmp ult i32 %6, 2
  br i1 %96, label %97, label %103

97:                                               ; preds = %95
  %98 = load i32, i32 addrspace(3)* %8, align 4, !tbaa !5
  %99 = add nuw nsw i32 %6, 2
  %100 = getelementptr inbounds i32, i32 addrspace(3)* bitcast ([4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem to i32 addrspace(3)*), i32 %99
  %101 = load i32, i32 addrspace(3)* %100, align 4, !tbaa !5
  %102 = add nsw i32 %101, %98
  store i32 %102, i32 addrspace(3)* %11, align 4, !tbaa !5
  br label %103

103:                                              ; preds = %97, %95
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %104 = icmp eq i32 %6, 0
  br i1 %104, label %105, label %111

105:                                              ; preds = %103
  %106 = load i32, i32 addrspace(3)* %11, align 4, !tbaa !5
  %107 = load i32, i32 addrspace(3)* bitcast (i8 addrspace(3)* getelementptr inbounds ([4096 x i8], [4096 x i8] addrspace(3)* @_ZZ26Image_SumReduceStep_KernelPiS_iE9sharedMem, i32 0, i32 516) to i32 addrspace(3)*), align 4, !tbaa !5
  %108 = add nsw i32 %107, %106
  %109 = zext i32 %4 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  store i32 %108, i32 addrspace(1)* %110, align 4, !tbaa !5
  br label %111

111:                                              ; preds = %105, %103
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!10, !14, i64 12}
!10 = !{!"hsa_kernel_dispatch_packet_s", !11, i64 0, !11, i64 2, !11, i64 4, !11, i64 6, !11, i64 8, !11, i64 10, !14, i64 12, !14, i64 16, !14, i64 20, !14, i64 24, !14, i64 28, !15, i64 32, !16, i64 40, !15, i64 48, !17, i64 56}
!11 = !{!"short", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!"int", !12, i64 0}
!15 = !{!"long", !12, i64 0}
!16 = !{!"any pointer", !12, i64 0}
!17 = !{!"hsa_signal_s", !15, i64 0}
!18 = !{i16 1, i16 1025}
!19 = !{}
