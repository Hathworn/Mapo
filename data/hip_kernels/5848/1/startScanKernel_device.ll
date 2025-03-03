; ModuleID = '../data/hip_kernels/5848/1/main.cu'
source_filename = "../data/hip_kernels/5848/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15startScanKerneliPKiPiS1_E4s_v0 = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16
@_ZZ15startScanKerneliPKiPiS1_E4s_v1 = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15startScanKerneliPKiPiS1_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl nsw i32 %6, 10
  %8 = or i32 %7, %5
  %9 = icmp slt i32 %8, %0
  br i1 %9, label %10, label %14

10:                                               ; preds = %4
  %11 = sext i32 %8 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %14

14:                                               ; preds = %4, %10
  %15 = phi i32 [ %13, %10 ], [ 0, %4 ]
  %16 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v0, i32 0, i32 %5
  store i32 %15, i32 addrspace(3)* %16, align 4, !tbaa !5
  %17 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v1, i32 0, i32 %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp eq i32 %5, 0
  %19 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !5
  br i1 %18, label %25, label %20

20:                                               ; preds = %14
  %21 = add nsw i32 %5, -1
  %22 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v0, i32 0, i32 %21
  %23 = load i32, i32 addrspace(3)* %22, align 4, !tbaa !5
  %24 = add nsw i32 %23, %19
  br label %25

25:                                               ; preds = %14, %20
  %26 = phi i32 [ %24, %20 ], [ %19, %14 ]
  store i32 %26, i32 addrspace(3)* %17, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = icmp ult i32 %5, 2
  %28 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  br i1 %27, label %34, label %29

29:                                               ; preds = %25
  %30 = add nsw i32 %5, -2
  %31 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v1, i32 0, i32 %30
  %32 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !5
  %33 = add nsw i32 %32, %28
  br label %34

34:                                               ; preds = %25, %29
  %35 = phi i32 [ %33, %29 ], [ %28, %25 ]
  store i32 %35, i32 addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp ult i32 %5, 4
  %37 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !5
  br i1 %36, label %43, label %38

38:                                               ; preds = %34
  %39 = add nsw i32 %5, -4
  %40 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v0, i32 0, i32 %39
  %41 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %42 = add nsw i32 %41, %37
  br label %43

43:                                               ; preds = %34, %38
  %44 = phi i32 [ %42, %38 ], [ %37, %34 ]
  store i32 %44, i32 addrspace(3)* %17, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp ult i32 %5, 8
  %46 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  br i1 %45, label %52, label %47

47:                                               ; preds = %43
  %48 = add nsw i32 %5, -8
  %49 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v1, i32 0, i32 %48
  %50 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %51 = add nsw i32 %50, %46
  br label %52

52:                                               ; preds = %43, %47
  %53 = phi i32 [ %51, %47 ], [ %46, %43 ]
  store i32 %53, i32 addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp ult i32 %5, 16
  %55 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !5
  br i1 %54, label %61, label %56

56:                                               ; preds = %52
  %57 = add nsw i32 %5, -16
  %58 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v0, i32 0, i32 %57
  %59 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !5
  %60 = add nsw i32 %59, %55
  br label %61

61:                                               ; preds = %52, %56
  %62 = phi i32 [ %60, %56 ], [ %55, %52 ]
  store i32 %62, i32 addrspace(3)* %17, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ult i32 %5, 32
  %64 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  br i1 %63, label %70, label %65

65:                                               ; preds = %61
  %66 = add nsw i32 %5, -32
  %67 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v1, i32 0, i32 %66
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %69 = add nsw i32 %68, %64
  br label %70

70:                                               ; preds = %61, %65
  %71 = phi i32 [ %69, %65 ], [ %64, %61 ]
  store i32 %71, i32 addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = icmp ult i32 %5, 64
  %73 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !5
  br i1 %72, label %79, label %74

74:                                               ; preds = %70
  %75 = add nsw i32 %5, -64
  %76 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v0, i32 0, i32 %75
  %77 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !5
  %78 = add nsw i32 %77, %73
  br label %79

79:                                               ; preds = %70, %74
  %80 = phi i32 [ %78, %74 ], [ %73, %70 ]
  store i32 %80, i32 addrspace(3)* %17, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp ult i32 %5, 128
  %82 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  br i1 %81, label %88, label %83

83:                                               ; preds = %79
  %84 = add nsw i32 %5, -128
  %85 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v1, i32 0, i32 %84
  %86 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !5
  %87 = add nsw i32 %86, %82
  br label %88

88:                                               ; preds = %79, %83
  %89 = phi i32 [ %87, %83 ], [ %82, %79 ]
  store i32 %89, i32 addrspace(3)* %16, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = icmp ult i32 %5, 256
  %91 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !5
  br i1 %90, label %97, label %92

92:                                               ; preds = %88
  %93 = add nsw i32 %5, -256
  %94 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v0, i32 0, i32 %93
  %95 = load i32, i32 addrspace(3)* %94, align 4, !tbaa !5
  %96 = add nsw i32 %95, %91
  br label %97

97:                                               ; preds = %88, %92
  %98 = phi i32 [ %96, %92 ], [ %91, %88 ]
  store i32 %98, i32 addrspace(3)* %17, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %99 = icmp ult i32 %5, 512
  %100 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  br i1 %99, label %106, label %101

101:                                              ; preds = %97
  %102 = add nsw i32 %5, -512
  %103 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ15startScanKerneliPKiPiS1_E4s_v1, i32 0, i32 %102
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !5
  %105 = add nsw i32 %104, %100
  br label %106

106:                                              ; preds = %97, %101
  %107 = phi i32 [ %105, %101 ], [ %100, %97 ]
  store i32 %107, i32 addrspace(3)* %16, align 4, !tbaa !5
  br i1 %9, label %108, label %112

108:                                              ; preds = %106
  %109 = add nsw i32 %8, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %110
  store i32 %107, i32 addrspace(1)* %111, align 4, !tbaa !5
  br label %112

112:                                              ; preds = %108, %106
  %113 = icmp eq i32 %5, 1023
  br i1 %113, label %114, label %118

114:                                              ; preds = %112
  %115 = add nsw i32 %6, 1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %116
  store i32 %107, i32 addrspace(1)* %117, align 4, !tbaa !5
  br label %118

118:                                              ; preds = %114, %112
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
