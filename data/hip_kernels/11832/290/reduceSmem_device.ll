; ModuleID = '../data/hip_kernels/11832/290/main.cu'
source_filename = "../data/hip_kernels/11832/290/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10reduceSmemPiS_jE4smem = internal addrspace(3) global [128 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10reduceSmemPiS_j(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %106

14:                                               ; preds = %3
  %15 = zext i32 %11 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = zext i32 %4 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %4
  store i32 %19, i32 addrspace(3)* %20, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp ugt i16 %9, 1023
  %22 = icmp ult i32 %4, 512
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %30

24:                                               ; preds = %14
  %25 = add nuw nsw i32 %4, 512
  %26 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %25
  %27 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !7
  %28 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !7
  %29 = add nsw i32 %28, %27
  store i32 %29, i32 addrspace(3)* %20, align 4, !tbaa !7
  br label %30

30:                                               ; preds = %24, %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp ugt i16 %9, 511
  %32 = icmp ult i32 %4, 256
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %40

34:                                               ; preds = %30
  %35 = add nuw nsw i32 %4, 256
  %36 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %35
  %37 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !7
  %38 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !7
  %39 = add nsw i32 %38, %37
  store i32 %39, i32 addrspace(3)* %20, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %34, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ugt i16 %9, 255
  %42 = icmp ult i32 %4, 128
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %44, label %50

44:                                               ; preds = %40
  %45 = add nuw nsw i32 %4, 128
  %46 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !7
  %49 = add nsw i32 %48, %47
  store i32 %49, i32 addrspace(3)* %20, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %44, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp ugt i16 %9, 127
  %52 = icmp ult i32 %4, 64
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %60

54:                                               ; preds = %50
  %55 = add nuw nsw i32 %4, 64
  %56 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %55
  %57 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !7
  %58 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !7
  %59 = add nsw i32 %58, %57
  store i32 %59, i32 addrspace(3)* %20, align 4, !tbaa !7
  br label %60

60:                                               ; preds = %54, %50
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = icmp ult i32 %4, 32
  br i1 %61, label %62, label %100

62:                                               ; preds = %60
  %63 = add nuw nsw i32 %4, 32
  %64 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %63
  %65 = addrspacecast i32 addrspace(3)* %64 to i32*
  %66 = load volatile i32, i32* %65, align 4, !tbaa !7
  %67 = addrspacecast i32 addrspace(3)* %20 to i32*
  %68 = load volatile i32, i32* %67, align 4, !tbaa !7
  %69 = add nsw i32 %68, %66
  store volatile i32 %69, i32* %67, align 4, !tbaa !7
  %70 = add nuw nsw i32 %4, 16
  %71 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %70
  %72 = addrspacecast i32 addrspace(3)* %71 to i32*
  %73 = load volatile i32, i32* %72, align 4, !tbaa !7
  %74 = load volatile i32, i32* %67, align 4, !tbaa !7
  %75 = add nsw i32 %74, %73
  store volatile i32 %75, i32* %67, align 4, !tbaa !7
  %76 = add nuw nsw i32 %4, 8
  %77 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %76
  %78 = addrspacecast i32 addrspace(3)* %77 to i32*
  %79 = load volatile i32, i32* %78, align 4, !tbaa !7
  %80 = load volatile i32, i32* %67, align 4, !tbaa !7
  %81 = add nsw i32 %80, %79
  store volatile i32 %81, i32* %67, align 4, !tbaa !7
  %82 = add nuw nsw i32 %4, 4
  %83 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %82
  %84 = addrspacecast i32 addrspace(3)* %83 to i32*
  %85 = load volatile i32, i32* %84, align 4, !tbaa !7
  %86 = load volatile i32, i32* %67, align 4, !tbaa !7
  %87 = add nsw i32 %86, %85
  store volatile i32 %87, i32* %67, align 4, !tbaa !7
  %88 = add nuw nsw i32 %4, 2
  %89 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %88
  %90 = addrspacecast i32 addrspace(3)* %89 to i32*
  %91 = load volatile i32, i32* %90, align 4, !tbaa !7
  %92 = load volatile i32, i32* %67, align 4, !tbaa !7
  %93 = add nsw i32 %92, %91
  store volatile i32 %93, i32* %67, align 4, !tbaa !7
  %94 = add nuw nsw i32 %4, 1
  %95 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 %94
  %96 = addrspacecast i32 addrspace(3)* %95 to i32*
  %97 = load volatile i32, i32* %96, align 4, !tbaa !7
  %98 = load volatile i32, i32* %67, align 4, !tbaa !7
  %99 = add nsw i32 %98, %97
  store volatile i32 %99, i32* %67, align 4, !tbaa !7
  br label %100

100:                                              ; preds = %62, %60
  %101 = icmp eq i32 %4, 0
  br i1 %101, label %102, label %106

102:                                              ; preds = %100
  %103 = load i32, i32 addrspace(3)* getelementptr inbounds ([128 x i32], [128 x i32] addrspace(3)* @_ZZ10reduceSmemPiS_jE4smem, i32 0, i32 0), align 16, !tbaa !7
  %104 = zext i32 %5 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %104
  store i32 %103, i32 addrspace(1)* %105, align 4, !tbaa !7
  br label %106

106:                                              ; preds = %100, %102, %3
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
