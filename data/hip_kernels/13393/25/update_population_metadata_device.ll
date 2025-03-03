; ModuleID = '../data/hip_kernels/13393/25/main.cu'
source_filename = "../data/hip_kernels/13393/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ26update_population_metadataPjjjS_S_S_E4sPop = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16
@_ZZ26update_population_metadataPjjjS_S_S_E5sMeta = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26update_population_metadataPjjjS_S_S_(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = mul nuw nsw i32 %7, %13
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = add nuw nsw i32 %15, %16
  %18 = and i32 %7, 1
  %19 = icmp eq i32 %18, 0
  %20 = sext i1 %19 to i32
  %21 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ26update_population_metadataPjjjS_S_S_E5sMeta, i32 0, i32 %17
  store i32 %20, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = add i32 %14, %16
  %23 = mul i32 %2, %1
  %24 = icmp eq i32 %1, 0
  br i1 %24, label %38, label %25

25:                                               ; preds = %6
  %26 = mul i32 %7, %2
  %27 = add i32 %22, %26
  %28 = sub nsw i32 0, %13
  %29 = select i1 %19, i32 %13, i32 %28
  %30 = add nsw i32 %17, %29
  %31 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ26update_population_metadataPjjjS_S_S_E4sPop, i32 0, i32 %17
  %32 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ26update_population_metadataPjjjS_S_S_E4sPop, i32 0, i32 %30
  %33 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %34 = bitcast i8 addrspace(4)* %33 to i16 addrspace(4)*
  %35 = load i16, i16 addrspace(4)* %34, align 2, !range !5, !invariant.load !6
  %36 = zext i16 %35 to i32
  %37 = mul i32 %36, %2
  br label %46

38:                                               ; preds = %66, %6
  %39 = and i32 %7, 3
  %40 = shl nuw nsw i32 %13, 1
  %41 = add nuw nsw i32 %40, %17
  %42 = and i32 %41, 1023
  %43 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %44 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ26update_population_metadataPjjjS_S_S_E5sMeta, i32 0, i32 %42
  %45 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %39, label %75 [
    i32 0, label %71
    i32 1, label %73
  ]

46:                                               ; preds = %25, %66
  %47 = phi i32 [ %27, %25 ], [ %69, %66 ]
  %48 = phi i32 [ 0, %25 ], [ %68, %66 ]
  %49 = icmp ult i32 %47, %23
  br i1 %49, label %50, label %54

50:                                               ; preds = %46
  %51 = zext i32 %47 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %54

54:                                               ; preds = %46, %50
  %55 = phi i32 [ %53, %50 ], [ 0, %46 ]
  store i32 %55, i32 addrspace(3)* %31, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !7
  %57 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  br i1 %49, label %59, label %66

59:                                               ; preds = %54
  br i1 %19, label %60, label %63

60:                                               ; preds = %59
  %61 = and i32 %57, %56
  %62 = and i32 %61, %58
  br label %66

63:                                               ; preds = %59
  %64 = or i32 %57, %56
  %65 = or i32 %64, %58
  br label %66

66:                                               ; preds = %60, %63, %54
  %67 = phi i32 [ %62, %60 ], [ %65, %63 ], [ %58, %54 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i32 %67, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = add i32 %48, %36
  %69 = add i32 %37, %47
  %70 = icmp ult i32 %68, %1
  br i1 %70, label %46, label %38, !llvm.loop !11

71:                                               ; preds = %38
  %72 = and i32 %45, %43
  br label %75

73:                                               ; preds = %38
  %74 = or i32 %45, %43
  br label %75

75:                                               ; preds = %38, %73, %71
  %76 = phi i32 [ %72, %71 ], [ %74, %73 ], [ %43, %38 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i32 %76, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = and i32 %7, 7
  %78 = shl nuw nsw i32 %13, 2
  %79 = add nuw nsw i32 %78, %17
  %80 = and i32 %79, 1023
  %81 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %82 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ26update_population_metadataPjjjS_S_S_E5sMeta, i32 0, i32 %80
  %83 = load i32, i32 addrspace(3)* %82, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %77, label %88 [
    i32 0, label %86
    i32 1, label %84
  ]

84:                                               ; preds = %75
  %85 = or i32 %83, %81
  br label %88

86:                                               ; preds = %75
  %87 = and i32 %83, %81
  br label %88

88:                                               ; preds = %86, %84, %75
  %89 = phi i32 [ %87, %86 ], [ %85, %84 ], [ %81, %75 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i32 %89, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = and i32 %7, 15
  %91 = shl nuw nsw i32 %13, 3
  %92 = add nuw nsw i32 %91, %17
  %93 = and i32 %92, 1023
  %94 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %95 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ26update_population_metadataPjjjS_S_S_E5sMeta, i32 0, i32 %93
  %96 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %90, label %101 [
    i32 0, label %99
    i32 1, label %97
  ]

97:                                               ; preds = %88
  %98 = or i32 %96, %94
  br label %101

99:                                               ; preds = %88
  %100 = and i32 %96, %94
  br label %101

101:                                              ; preds = %99, %97, %88
  %102 = phi i32 [ %100, %99 ], [ %98, %97 ], [ %94, %88 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i32 %102, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = and i32 %7, 31
  %104 = shl nuw nsw i32 %13, 4
  %105 = add nuw nsw i32 %104, %17
  %106 = and i32 %105, 1023
  %107 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %108 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ26update_population_metadataPjjjS_S_S_E5sMeta, i32 0, i32 %106
  %109 = load i32, i32 addrspace(3)* %108, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %103, label %114 [
    i32 0, label %112
    i32 1, label %110
  ]

110:                                              ; preds = %101
  %111 = or i32 %109, %107
  br label %114

112:                                              ; preds = %101
  %113 = and i32 %109, %107
  br label %114

114:                                              ; preds = %112, %110, %101
  %115 = phi i32 [ %113, %112 ], [ %111, %110 ], [ %107, %101 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i32 %115, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %116 = icmp eq i32 %7, 0
  br i1 %116, label %117, label %129

117:                                              ; preds = %114
  %118 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ26update_population_metadataPjjjS_S_S_E5sMeta, i32 0, i32 %16
  %119 = load i32, i32 addrspace(3)* %118, align 4, !tbaa !7
  %120 = add nuw nsw i32 %16, %13
  %121 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ26update_population_metadataPjjjS_S_S_E5sMeta, i32 0, i32 %120
  %122 = load i32, i32 addrspace(3)* %121, align 4, !tbaa !7
  %123 = xor i32 %122, -1
  %124 = or i32 %119, %123
  %125 = zext i32 %22 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %125
  store i32 %124, i32 addrspace(1)* %126, align 4, !tbaa !7
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %125
  store i32 %119, i32 addrspace(1)* %127, align 4, !tbaa !7
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %125
  store i32 %123, i32 addrspace(1)* %128, align 4, !tbaa !7
  br label %129

129:                                              ; preds = %117, %114
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
