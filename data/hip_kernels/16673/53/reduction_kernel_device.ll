; ModuleID = '../data/hip_kernels/16673/53/main.cu'
source_filename = "../data/hip_kernels/16673/53/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_data = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16reduction_kernelPfS_j(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = icmp ult i32 %15, %2
  br i1 %16, label %17, label %46

17:                                               ; preds = %3
  %18 = udiv i32 %12, %9
  %19 = mul i32 %18, %9
  %20 = icmp ugt i32 %12, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = shl nuw nsw i32 %9, 2
  %24 = mul i32 %23, %22
  %25 = mul i32 %22, %9
  %26 = shl nuw nsw i32 %9, 1
  %27 = mul i32 %26, %22
  %28 = mul nuw nsw i32 %9, 3
  %29 = mul i32 %28, %22
  br label %30

30:                                               ; preds = %17, %72
  %31 = phi float [ 0.000000e+00, %17 ], [ %39, %72 ]
  %32 = phi float [ 0.000000e+00, %17 ], [ %56, %72 ]
  %33 = phi float [ 0.000000e+00, %17 ], [ %65, %72 ]
  %34 = phi float [ 0.000000e+00, %17 ], [ %74, %72 ]
  %35 = phi i32 [ %15, %17 ], [ %75, %72 ]
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16, !amdgpu.noclobber !5
  %39 = fadd contract float %38, %31
  %40 = add i32 %25, %35
  %41 = icmp ult i32 %40, %2
  br i1 %41, label %50, label %54

42:                                               ; preds = %72
  %43 = fadd contract float %56, %39
  %44 = fadd contract float %65, %43
  %45 = fadd contract float %74, %44
  br label %46

46:                                               ; preds = %42, %3
  %47 = phi float [ %45, %42 ], [ 0.000000e+00, %3 ]
  %48 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %14
  store float %47, float addrspace(3)* %48, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ult i16 %8, 2
  br i1 %49, label %77, label %79

50:                                               ; preds = %30
  %51 = zext i32 %40 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16, !amdgpu.noclobber !5
  br label %54

54:                                               ; preds = %50, %30
  %55 = phi contract float [ %53, %50 ], [ 0.000000e+00, %30 ]
  %56 = fadd contract float %55, %32
  %57 = add i32 %27, %35
  %58 = icmp ult i32 %57, %2
  br i1 %58, label %59, label %63

59:                                               ; preds = %54
  %60 = zext i32 %57 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !5
  br label %63

63:                                               ; preds = %59, %54
  %64 = phi contract float [ %62, %59 ], [ 0.000000e+00, %54 ]
  %65 = fadd contract float %64, %33
  %66 = add i32 %29, %35
  %67 = icmp ult i32 %66, %2
  br i1 %67, label %68, label %72

68:                                               ; preds = %63
  %69 = zext i32 %66 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16, !amdgpu.noclobber !5
  br label %72

72:                                               ; preds = %68, %63
  %73 = phi contract float [ %71, %68 ], [ 0.000000e+00, %63 ]
  %74 = fadd contract float %73, %34
  %75 = add i32 %24, %35
  %76 = icmp ult i32 %75, %2
  br i1 %76, label %30, label %42, !llvm.loop !20

77:                                               ; preds = %89, %46
  %78 = icmp eq i32 %14, 0
  br i1 %78, label %91, label %95

79:                                               ; preds = %46, %89
  %80 = phi i32 [ %81, %89 ], [ %9, %46 ]
  %81 = lshr i32 %80, 1
  %82 = icmp ult i32 %14, %81
  br i1 %82, label %83, label %89

83:                                               ; preds = %79
  %84 = add nuw nsw i32 %81, %14
  %85 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !16
  %87 = load float, float addrspace(3)* %48, align 4, !tbaa !16
  %88 = fadd contract float %86, %87
  store float %88, float addrspace(3)* %48, align 4, !tbaa !16
  br label %89

89:                                               ; preds = %83, %79
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = icmp ult i32 %80, 4
  br i1 %90, label %77, label %79, !llvm.loop !22

91:                                               ; preds = %77
  %92 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @s_data, i32 0, i32 0), align 4, !tbaa !16
  %93 = zext i32 %4 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  store float %92, float addrspace(1)* %94, align 4, !tbaa !16
  br label %95

95:                                               ; preds = %91, %77
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
