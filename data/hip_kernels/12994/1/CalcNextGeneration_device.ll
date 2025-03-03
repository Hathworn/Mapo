; ModuleID = '../data/hip_kernels/12994/1/main.cu'
source_filename = "../data/hip_kernels/12994/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z18CalcNextGenerationPiS_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %3, %2
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %124

16:                                               ; preds = %4
  %17 = freeze i32 %13
  %18 = freeze i32 %2
  %19 = sdiv i32 %17, %18
  %20 = sitofp i32 %19 to float
  %21 = fptosi float %20 to i32
  %22 = mul i32 %19, %18
  %23 = sub i32 %17, %22
  %24 = add nsw i32 %23, -1
  %25 = srem i32 %24, %2
  %26 = icmp slt i32 %25, 0
  %27 = select i1 %26, i32 %2, i32 0
  %28 = add nsw i32 %27, %25
  %29 = add nsw i32 %21, -1
  %30 = srem i32 %29, %3
  %31 = icmp slt i32 %30, 0
  %32 = select i1 %31, i32 %3, i32 0
  %33 = add nsw i32 %32, %30
  %34 = mul nsw i32 %33, %2
  %35 = add nsw i32 %34, %28
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = icmp eq i32 %38, 1
  %40 = zext i1 %39 to i32
  %41 = srem i32 %21, %3
  %42 = icmp slt i32 %41, 0
  %43 = select i1 %42, i32 %3, i32 0
  %44 = add nsw i32 %43, %41
  %45 = mul nsw i32 %44, %2
  %46 = add nsw i32 %45, %28
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = icmp eq i32 %49, 1
  %51 = zext i1 %50 to i32
  %52 = add nuw nsw i32 %51, %40
  %53 = add nsw i32 %21, 1
  %54 = srem i32 %53, %3
  %55 = icmp slt i32 %54, 0
  %56 = select i1 %55, i32 %3, i32 0
  %57 = add nsw i32 %56, %54
  %58 = mul nsw i32 %57, %2
  %59 = add nsw i32 %58, %28
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = icmp eq i32 %62, 1
  %64 = zext i1 %63 to i32
  %65 = add nuw nsw i32 %52, %64
  %66 = icmp slt i32 %23, 0
  %67 = select i1 %66, i32 %2, i32 0
  %68 = add nsw i32 %67, %23
  %69 = add nsw i32 %34, %68
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = icmp eq i32 %72, 1
  %74 = zext i1 %73 to i32
  %75 = add nuw nsw i32 %65, %74
  %76 = add nsw i32 %58, %68
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = icmp eq i32 %79, 1
  %81 = zext i1 %80 to i32
  %82 = add nuw nsw i32 %75, %81
  %83 = add nsw i32 %23, 1
  %84 = srem i32 %83, %2
  %85 = icmp slt i32 %84, 0
  %86 = select i1 %85, i32 %2, i32 0
  %87 = add nsw i32 %86, %84
  %88 = add nsw i32 %87, %34
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = icmp eq i32 %91, 1
  %93 = zext i1 %92 to i32
  %94 = add nuw nsw i32 %82, %93
  %95 = add nsw i32 %87, %45
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %96
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = icmp eq i32 %98, 1
  %100 = zext i1 %99 to i32
  %101 = add nuw nsw i32 %94, %100
  %102 = add nsw i32 %87, %58
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = icmp eq i32 %105, 1
  %107 = zext i1 %106 to i32
  %108 = add nuw nsw i32 %101, %107
  switch i32 %108, label %109 [
    i32 3, label %111
    i32 2, label %113
  ]

109:                                              ; preds = %16
  %110 = sext i32 %13 to i64
  br label %118

111:                                              ; preds = %16
  %112 = sext i32 %13 to i64
  br label %120

113:                                              ; preds = %16
  %114 = sext i32 %13 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = icmp eq i32 %116, 1
  br i1 %117, label %120, label %118

118:                                              ; preds = %109, %113
  %119 = phi i64 [ %110, %109 ], [ %114, %113 ]
  br label %120

120:                                              ; preds = %113, %111, %118
  %121 = phi i64 [ %119, %118 ], [ %112, %111 ], [ %114, %113 ]
  %122 = phi i32 [ 0, %118 ], [ 1, %111 ], [ 1, %113 ]
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %121
  store i32 %122, i32 addrspace(1)* %123, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %124

124:                                              ; preds = %4, %120
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
