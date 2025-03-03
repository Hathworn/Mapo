; ModuleID = '../data/hip_kernels/11832/292/main.cu'
source_filename = "../data/hip_kernels/11832/292/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16reduceGmemUnrollPiS_j(i32 addrspace(1)* %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 2
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = mul nuw nsw i32 %10, 3
  %17 = add i32 %13, %16
  %18 = icmp ult i32 %17, %2
  br i1 %18, label %19, label %38

19:                                               ; preds = %3
  %20 = zext i32 %13 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = add i32 %13, %10
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = shl nuw nsw i32 %10, 1
  %28 = add i32 %13, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = zext i32 %17 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = add nsw i32 %26, %22
  %36 = add nsw i32 %35, %31
  %37 = add nsw i32 %36, %34
  store i32 %37, i32 addrspace(1)* %21, align 4, !tbaa !7
  br label %38

38:                                               ; preds = %19, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ugt i16 %9, 1023
  %40 = icmp ult i32 %4, 512
  %41 = select i1 %39, i1 %40, i1 false
  br i1 %41, label %42, label %51

42:                                               ; preds = %38
  %43 = add nuw nsw i32 %4, 512
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %47 = zext i32 %4 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7
  %50 = add nsw i32 %49, %46
  store i32 %50, i32 addrspace(1)* %48, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %42, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp ugt i16 %9, 511
  %53 = icmp ult i32 %4, 256
  %54 = select i1 %52, i1 %53, i1 false
  br i1 %54, label %55, label %64

55:                                               ; preds = %51
  %56 = add nuw nsw i32 %4, 256
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7
  %60 = zext i32 %4 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7
  %63 = add nsw i32 %62, %59
  store i32 %63, i32 addrspace(1)* %61, align 4, !tbaa !7
  br label %64

64:                                               ; preds = %55, %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = icmp ugt i16 %9, 255
  %66 = icmp ult i32 %4, 128
  %67 = select i1 %65, i1 %66, i1 false
  br i1 %67, label %68, label %77

68:                                               ; preds = %64
  %69 = add nuw nsw i32 %4, 128
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7
  %73 = zext i32 %4 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7
  %76 = add nsw i32 %75, %72
  store i32 %76, i32 addrspace(1)* %74, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %68, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = icmp ugt i16 %9, 127
  %79 = icmp ult i32 %4, 64
  %80 = select i1 %78, i1 %79, i1 false
  br i1 %80, label %81, label %90

81:                                               ; preds = %77
  %82 = add nuw nsw i32 %4, 64
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = zext i32 %4 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7
  %89 = add nsw i32 %88, %85
  store i32 %89, i32 addrspace(1)* %87, align 4, !tbaa !7
  br label %90

90:                                               ; preds = %81, %77
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = icmp ult i32 %4, 32
  br i1 %91, label %92, label %138

92:                                               ; preds = %90
  %93 = add nuw nsw i32 %4, 32
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %94
  %96 = addrspacecast i32 addrspace(1)* %95 to i32*
  %97 = load volatile i32, i32* %96, align 4, !tbaa !7
  %98 = zext i32 %4 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %98
  %100 = addrspacecast i32 addrspace(1)* %99 to i32*
  %101 = load volatile i32, i32* %100, align 4, !tbaa !7
  %102 = add nsw i32 %101, %97
  store volatile i32 %102, i32* %100, align 4, !tbaa !7
  %103 = add nuw nsw i32 %4, 16
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %104
  %106 = addrspacecast i32 addrspace(1)* %105 to i32*
  %107 = load volatile i32, i32* %106, align 4, !tbaa !7
  %108 = load volatile i32, i32* %100, align 4, !tbaa !7
  %109 = add nsw i32 %108, %107
  store volatile i32 %109, i32* %100, align 4, !tbaa !7
  %110 = add nuw nsw i32 %4, 8
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %111
  %113 = addrspacecast i32 addrspace(1)* %112 to i32*
  %114 = load volatile i32, i32* %113, align 4, !tbaa !7
  %115 = load volatile i32, i32* %100, align 4, !tbaa !7
  %116 = add nsw i32 %115, %114
  store volatile i32 %116, i32* %100, align 4, !tbaa !7
  %117 = add nuw nsw i32 %4, 4
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %118
  %120 = addrspacecast i32 addrspace(1)* %119 to i32*
  %121 = load volatile i32, i32* %120, align 4, !tbaa !7
  %122 = load volatile i32, i32* %100, align 4, !tbaa !7
  %123 = add nsw i32 %122, %121
  store volatile i32 %123, i32* %100, align 4, !tbaa !7
  %124 = add nuw nsw i32 %4, 2
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %125
  %127 = addrspacecast i32 addrspace(1)* %126 to i32*
  %128 = load volatile i32, i32* %127, align 4, !tbaa !7
  %129 = load volatile i32, i32* %100, align 4, !tbaa !7
  %130 = add nsw i32 %129, %128
  store volatile i32 %130, i32* %100, align 4, !tbaa !7
  %131 = add nuw nsw i32 %4, 1
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %132
  %134 = addrspacecast i32 addrspace(1)* %133 to i32*
  %135 = load volatile i32, i32* %134, align 4, !tbaa !7
  %136 = load volatile i32, i32* %100, align 4, !tbaa !7
  %137 = add nsw i32 %136, %135
  store volatile i32 %137, i32* %100, align 4, !tbaa !7
  br label %138

138:                                              ; preds = %92, %90
  %139 = icmp eq i32 %4, 0
  br i1 %139, label %140, label %144

140:                                              ; preds = %138
  %141 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %142 = zext i32 %5 to i64
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %142
  store i32 %141, i32 addrspace(1)* %143, align 4, !tbaa !7
  br label %144

144:                                              ; preds = %140, %138
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
