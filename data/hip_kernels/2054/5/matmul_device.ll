; ModuleID = '../data/hip_kernels/2054/5/main.cu'
source_filename = "../data/hip_kernels/2054/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6matmulPiiS_iiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = mul nsw i32 %10, %8
  %13 = add nsw i32 %12, %11
  %14 = sdiv i32 %13, %6
  %15 = icmp sgt i32 %3, 0
  br i1 %15, label %16, label %134

16:                                               ; preds = %9
  %17 = mul nsw i32 %14, %6
  %18 = sub nsw i32 %13, %17
  %19 = mul nsw i32 %14, %1
  %20 = and i32 %3, 7
  %21 = icmp ult i32 %3, 8
  br i1 %21, label %111, label %22

22:                                               ; preds = %16
  %23 = and i32 %3, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 0, %22 ], [ %106, %24 ]
  %26 = phi i32 [ %19, %22 ], [ %107, %24 ]
  %27 = phi i32 [ %18, %22 ], [ %108, %24 ]
  %28 = phi i32 [ 0, %22 ], [ %109, %24 ]
  %29 = sext i32 %26 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = sext i32 %27 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = mul nsw i32 %34, %31
  %36 = add nsw i32 %35, %25
  %37 = add nsw i32 %26, 1
  %38 = add nsw i32 %27, %4
  %39 = sext i32 %37 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = sext i32 %38 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !5, !amdgpu.noclobber !9
  %45 = mul nsw i32 %44, %41
  %46 = add nsw i32 %45, %36
  %47 = add nsw i32 %26, 2
  %48 = add nsw i32 %38, %4
  %49 = sext i32 %47 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = sext i32 %48 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = mul nsw i32 %54, %51
  %56 = add nsw i32 %55, %46
  %57 = add nsw i32 %26, 3
  %58 = add nsw i32 %48, %4
  %59 = sext i32 %57 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = sext i32 %58 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  %65 = mul nsw i32 %64, %61
  %66 = add nsw i32 %65, %56
  %67 = add nsw i32 %26, 4
  %68 = add nsw i32 %58, %4
  %69 = sext i32 %67 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !5, !amdgpu.noclobber !9
  %72 = sext i32 %68 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !5, !amdgpu.noclobber !9
  %75 = mul nsw i32 %74, %71
  %76 = add nsw i32 %75, %66
  %77 = add nsw i32 %26, 5
  %78 = add nsw i32 %68, %4
  %79 = sext i32 %77 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = sext i32 %78 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !5, !amdgpu.noclobber !9
  %85 = mul nsw i32 %84, %81
  %86 = add nsw i32 %85, %76
  %87 = add nsw i32 %26, 6
  %88 = add nsw i32 %78, %4
  %89 = sext i32 %87 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = sext i32 %88 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  %95 = mul nsw i32 %94, %91
  %96 = add nsw i32 %95, %86
  %97 = add nsw i32 %26, 7
  %98 = add nsw i32 %88, %4
  %99 = sext i32 %97 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  %102 = sext i32 %98 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %102
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !5, !amdgpu.noclobber !9
  %105 = mul nsw i32 %104, %101
  %106 = add nsw i32 %105, %96
  %107 = add nsw i32 %26, 8
  %108 = add nsw i32 %98, %4
  %109 = add i32 %28, 8
  %110 = icmp eq i32 %109, %23
  br i1 %110, label %111, label %24, !llvm.loop !10

111:                                              ; preds = %24, %16
  %112 = phi i32 [ undef, %16 ], [ %106, %24 ]
  %113 = phi i32 [ 0, %16 ], [ %106, %24 ]
  %114 = phi i32 [ %19, %16 ], [ %107, %24 ]
  %115 = phi i32 [ %18, %16 ], [ %108, %24 ]
  %116 = icmp eq i32 %20, 0
  br i1 %116, label %134, label %117

117:                                              ; preds = %111, %117
  %118 = phi i32 [ %129, %117 ], [ %113, %111 ]
  %119 = phi i32 [ %130, %117 ], [ %114, %111 ]
  %120 = phi i32 [ %131, %117 ], [ %115, %111 ]
  %121 = phi i32 [ %132, %117 ], [ 0, %111 ]
  %122 = sext i32 %119 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !5, !amdgpu.noclobber !9
  %125 = sext i32 %120 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = mul nsw i32 %127, %124
  %129 = add nsw i32 %128, %118
  %130 = add nsw i32 %119, 1
  %131 = add nsw i32 %120, %4
  %132 = add i32 %121, 1
  %133 = icmp eq i32 %132, %20
  br i1 %133, label %134, label %117, !llvm.loop !12

134:                                              ; preds = %111, %117, %9
  %135 = phi i32 [ 0, %9 ], [ %112, %111 ], [ %129, %117 ]
  %136 = sext i32 %13 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %136
  store i32 %135, i32 addrspace(1)* %137, align 4, !tbaa !5
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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
