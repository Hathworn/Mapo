; ModuleID = '../data/hip_kernels/4933/284/main.cu'
source_filename = "../data/hip_kernels/4933/284/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10reduceGmemPiS_j(i32 addrspace(1)* %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = add i32 %11, %4
  %15 = icmp ult i32 %14, %2
  br i1 %15, label %16, label %122

16:                                               ; preds = %3
  %17 = icmp ugt i16 %9, 1023
  %18 = icmp ult i32 %4, 512
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %29

20:                                               ; preds = %16
  %21 = add nuw nsw i32 %4, 512
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = zext i32 %4 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = add nsw i32 %27, %24
  store i32 %28, i32 addrspace(1)* %26, align 4, !tbaa !7
  br label %29

29:                                               ; preds = %20, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp ugt i16 %9, 511
  %31 = icmp ult i32 %4, 256
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %42

33:                                               ; preds = %29
  %34 = add nuw nsw i32 %4, 256
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = zext i32 %4 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %41 = add nsw i32 %40, %37
  store i32 %41, i32 addrspace(1)* %39, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %33, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp ugt i16 %9, 255
  %44 = icmp ult i32 %4, 128
  %45 = select i1 %43, i1 %44, i1 false
  br i1 %45, label %46, label %55

46:                                               ; preds = %42
  %47 = add nuw nsw i32 %4, 128
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = zext i32 %4 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7
  %54 = add nsw i32 %53, %50
  store i32 %54, i32 addrspace(1)* %52, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %46, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ugt i16 %9, 127
  %57 = icmp ult i32 %4, 64
  %58 = select i1 %56, i1 %57, i1 false
  br i1 %58, label %59, label %68

59:                                               ; preds = %55
  %60 = add nuw nsw i32 %4, 64
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %64 = zext i32 %4 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7
  %67 = add nsw i32 %66, %63
  store i32 %67, i32 addrspace(1)* %65, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %59, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = icmp ult i32 %4, 32
  br i1 %69, label %70, label %116

70:                                               ; preds = %68
  %71 = add nuw nsw i32 %4, 32
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %72
  %74 = addrspacecast i32 addrspace(1)* %73 to i32*
  %75 = load volatile i32, i32* %74, align 4, !tbaa !7
  %76 = zext i32 %4 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %76
  %78 = addrspacecast i32 addrspace(1)* %77 to i32*
  %79 = load volatile i32, i32* %78, align 4, !tbaa !7
  %80 = add nsw i32 %79, %75
  store volatile i32 %80, i32* %78, align 4, !tbaa !7
  %81 = add nuw nsw i32 %4, 16
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %82
  %84 = addrspacecast i32 addrspace(1)* %83 to i32*
  %85 = load volatile i32, i32* %84, align 4, !tbaa !7
  %86 = load volatile i32, i32* %78, align 4, !tbaa !7
  %87 = add nsw i32 %86, %85
  store volatile i32 %87, i32* %78, align 4, !tbaa !7
  %88 = add nuw nsw i32 %4, 8
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %89
  %91 = addrspacecast i32 addrspace(1)* %90 to i32*
  %92 = load volatile i32, i32* %91, align 4, !tbaa !7
  %93 = load volatile i32, i32* %78, align 4, !tbaa !7
  %94 = add nsw i32 %93, %92
  store volatile i32 %94, i32* %78, align 4, !tbaa !7
  %95 = add nuw nsw i32 %4, 4
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %96
  %98 = addrspacecast i32 addrspace(1)* %97 to i32*
  %99 = load volatile i32, i32* %98, align 4, !tbaa !7
  %100 = load volatile i32, i32* %78, align 4, !tbaa !7
  %101 = add nsw i32 %100, %99
  store volatile i32 %101, i32* %78, align 4, !tbaa !7
  %102 = add nuw nsw i32 %4, 2
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %103
  %105 = addrspacecast i32 addrspace(1)* %104 to i32*
  %106 = load volatile i32, i32* %105, align 4, !tbaa !7
  %107 = load volatile i32, i32* %78, align 4, !tbaa !7
  %108 = add nsw i32 %107, %106
  store volatile i32 %108, i32* %78, align 4, !tbaa !7
  %109 = add nuw nsw i32 %4, 1
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %110
  %112 = addrspacecast i32 addrspace(1)* %111 to i32*
  %113 = load volatile i32, i32* %112, align 4, !tbaa !7
  %114 = load volatile i32, i32* %78, align 4, !tbaa !7
  %115 = add nsw i32 %114, %113
  store volatile i32 %115, i32* %78, align 4, !tbaa !7
  br label %116

116:                                              ; preds = %70, %68
  %117 = icmp eq i32 %4, 0
  br i1 %117, label %118, label %122

118:                                              ; preds = %116
  %119 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7
  %120 = zext i32 %5 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %120
  store i32 %119, i32 addrspace(1)* %121, align 4, !tbaa !7
  br label %122

122:                                              ; preds = %116, %118, %3
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
