; ModuleID = '../data/hip_kernels/7981/10/main.cu'
source_filename = "../data/hip_kernels/7981/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18reduceUnrollWarps8PiS_j(i32 addrspace(1)* %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 3
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %4
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = mul nuw nsw i32 %11, 7
  %17 = add i32 %13, %16
  %18 = icmp ult i32 %17, %2
  br i1 %18, label %19, label %62

19:                                               ; preds = %3
  %20 = add i32 %13, %11
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = zext i32 %13 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = add nsw i32 %26, %23
  %28 = shl nuw nsw i32 %11, 1
  %29 = add i32 %13, %28
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %33 = add nsw i32 %32, %27
  %34 = mul nuw nsw i32 %11, 3
  %35 = add i32 %13, %34
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = add nsw i32 %38, %33
  %40 = shl nuw nsw i32 %11, 2
  %41 = add i32 %13, %40
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  %45 = add nsw i32 %44, %39
  %46 = mul nuw nsw i32 %11, 5
  %47 = add i32 %13, %46
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = add nsw i32 %50, %45
  %52 = mul nuw nsw i32 %11, 6
  %53 = add i32 %13, %52
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  %57 = add nsw i32 %56, %51
  %58 = zext i32 %17 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7
  %61 = add nsw i32 %60, %57
  store i32 %61, i32 addrspace(1)* %25, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %19, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ugt i16 %10, 65
  br i1 %63, label %64, label %67

64:                                               ; preds = %62
  %65 = zext i32 %4 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %65
  br label %69

67:                                               ; preds = %80, %62
  %68 = icmp ult i32 %4, 32
  br i1 %68, label %82, label %128

69:                                               ; preds = %64, %80
  %70 = phi i32 [ %11, %64 ], [ %71, %80 ]
  %71 = lshr i32 %70, 1
  %72 = icmp ult i32 %4, %71
  br i1 %72, label %73, label %80

73:                                               ; preds = %69
  %74 = add nuw nsw i32 %71, %4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !7
  %78 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7
  %79 = add nsw i32 %78, %77
  store i32 %79, i32 addrspace(1)* %66, align 4, !tbaa !7
  br label %80

80:                                               ; preds = %73, %69
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp ugt i32 %70, 131
  br i1 %81, label %69, label %67, !llvm.loop !11

82:                                               ; preds = %67
  %83 = add nuw nsw i32 %4, 32
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %84
  %86 = addrspacecast i32 addrspace(1)* %85 to i32*
  %87 = load volatile i32, i32* %86, align 4, !tbaa !7
  %88 = zext i32 %4 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %88
  %90 = addrspacecast i32 addrspace(1)* %89 to i32*
  %91 = load volatile i32, i32* %90, align 4, !tbaa !7
  %92 = add nsw i32 %91, %87
  store volatile i32 %92, i32* %90, align 4, !tbaa !7
  %93 = add nuw nsw i32 %4, 16
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %94
  %96 = addrspacecast i32 addrspace(1)* %95 to i32*
  %97 = load volatile i32, i32* %96, align 4, !tbaa !7
  %98 = load volatile i32, i32* %90, align 4, !tbaa !7
  %99 = add nsw i32 %98, %97
  store volatile i32 %99, i32* %90, align 4, !tbaa !7
  %100 = add nuw nsw i32 %4, 8
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %101
  %103 = addrspacecast i32 addrspace(1)* %102 to i32*
  %104 = load volatile i32, i32* %103, align 4, !tbaa !7
  %105 = load volatile i32, i32* %90, align 4, !tbaa !7
  %106 = add nsw i32 %105, %104
  store volatile i32 %106, i32* %90, align 4, !tbaa !7
  %107 = add nuw nsw i32 %4, 4
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %108
  %110 = addrspacecast i32 addrspace(1)* %109 to i32*
  %111 = load volatile i32, i32* %110, align 4, !tbaa !7
  %112 = load volatile i32, i32* %90, align 4, !tbaa !7
  %113 = add nsw i32 %112, %111
  store volatile i32 %113, i32* %90, align 4, !tbaa !7
  %114 = add nuw nsw i32 %4, 2
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %115
  %117 = addrspacecast i32 addrspace(1)* %116 to i32*
  %118 = load volatile i32, i32* %117, align 4, !tbaa !7
  %119 = load volatile i32, i32* %90, align 4, !tbaa !7
  %120 = add nsw i32 %119, %118
  store volatile i32 %120, i32* %90, align 4, !tbaa !7
  %121 = add nuw nsw i32 %4, 1
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %122
  %124 = addrspacecast i32 addrspace(1)* %123 to i32*
  %125 = load volatile i32, i32* %124, align 4, !tbaa !7
  %126 = load volatile i32, i32* %90, align 4, !tbaa !7
  %127 = add nsw i32 %126, %125
  store volatile i32 %127, i32* %90, align 4, !tbaa !7
  br label %128

128:                                              ; preds = %82, %67
  %129 = icmp eq i32 %4, 0
  br i1 %129, label %130, label %134

130:                                              ; preds = %128
  %131 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %132 = zext i32 %5 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %132
  store i32 %131, i32 addrspace(1)* %133, align 4, !tbaa !7
  br label %134

134:                                              ; preds = %130, %128
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
