; ModuleID = '../data/hip_kernels/14299/0/main.cu'
source_filename = "../data/hip_kernels/14299/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7iteratePfS_iiE16originalMatrixDS = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z7iteratePfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !5
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !14, !invariant.load !15
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %7
  %24 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !14, !invariant.load !15
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = add i32 %28, %6
  %30 = mul i32 %29, %16
  %31 = add i32 %5, %3
  %32 = add i32 %31, %30
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !15
  %36 = shl nuw nsw i32 %6, 5
  %37 = add nuw nsw i32 %36, %5
  %38 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ7iteratePfS_iiE16originalMatrixDS, i32 0, i32 %37
  store float %35, float addrspace(3)* %38, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = srem i32 %32, %2
  %40 = icmp eq i32 %39, 0
  %41 = add nsw i32 %2, -1
  %42 = icmp eq i32 %39, %41
  %43 = select i1 %40, i1 true, i1 %42
  %44 = icmp slt i32 %32, %2
  %45 = select i1 %43, i1 true, i1 %44
  br i1 %45, label %50, label %46

46:                                               ; preds = %4
  %47 = mul nsw i32 %2, %2
  %48 = sub nsw i32 %47, %2
  %49 = icmp slt i32 %32, %48
  br i1 %49, label %52, label %50

50:                                               ; preds = %4, %46
  %51 = load float, float addrspace(3)* %38, align 4, !tbaa !16
  br label %95

52:                                               ; preds = %46
  %53 = sub nsw i32 %32, %2
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16, !amdgpu.noclobber !15
  %57 = add nsw i32 %32, %2
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16, !amdgpu.noclobber !15
  %61 = icmp eq i32 %5, 0
  %62 = icmp eq i32 %6, 0
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %64, label %69

64:                                               ; preds = %52
  %65 = add nsw i32 %32, -1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = addrspacecast float addrspace(1)* %67 to float*
  br label %73

69:                                               ; preds = %52
  %70 = add nsw i32 %37, -1
  %71 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ7iteratePfS_iiE16originalMatrixDS, i32 0, i32 %70
  %72 = addrspacecast float addrspace(3)* %71 to float*
  br label %73

73:                                               ; preds = %69, %64
  %74 = phi float* [ %68, %64 ], [ %72, %69 ]
  %75 = load float, float* %74, align 4, !tbaa !16
  %76 = icmp eq i32 %6, 31
  %77 = icmp eq i32 %5, 31
  %78 = select i1 %76, i1 %77, i1 false
  br i1 %78, label %79, label %84

79:                                               ; preds = %73
  %80 = add nsw i32 %32, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = addrspacecast float addrspace(1)* %82 to float*
  br label %88

84:                                               ; preds = %73
  %85 = add nuw nsw i32 %37, 1
  %86 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ7iteratePfS_iiE16originalMatrixDS, i32 0, i32 %85
  %87 = addrspacecast float addrspace(3)* %86 to float*
  br label %88

88:                                               ; preds = %84, %79
  %89 = phi float* [ %83, %79 ], [ %87, %84 ]
  %90 = load float, float* %89, align 4, !tbaa !16
  %91 = fadd contract float %75, %90
  %92 = fadd contract float %56, %91
  %93 = fadd contract float %60, %92
  %94 = fmul contract float %93, 2.500000e-01
  br label %95

95:                                               ; preds = %88, %50
  %96 = phi float [ %51, %50 ], [ %94, %88 ]
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  store float %96, float addrspace(1)* %97, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
