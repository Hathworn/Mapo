; ModuleID = '../data/hip_kernels/17971/2/main.cu'
source_filename = "../data/hip_kernels/17971/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16tissueGPU4KernelPiPfS0_S0_S0_iif(i32 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6, float %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = freeze i32 %17
  %19 = freeze i32 %6
  %20 = sdiv i32 %18, %19
  %21 = mul i32 %20, %19
  %22 = sub i32 %18, %21
  %23 = shl nsw i32 %5, 1
  %24 = icmp sge i32 %20, %5
  br i1 %24, label %81, label %25

25:                                               ; preds = %8
  %26 = sext i32 %20 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = add nsw i32 %20, %5
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = add nsw i32 %20, %23
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = icmp slt i32 %22, %5
  br i1 %37, label %38, label %72

38:                                               ; preds = %25, %38
  %39 = phi float [ %69, %38 ], [ 0.000000e+00, %25 ]
  %40 = phi i32 [ %70, %38 ], [ %22, %25 ]
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = sub nsw i32 %43, %28
  %45 = tail call i32 @llvm.abs.i32(i32 %44, i1 true)
  %46 = add nsw i32 %40, %5
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = sub nsw i32 %49, %32
  %51 = tail call i32 @llvm.abs.i32(i32 %50, i1 true)
  %52 = add nuw nsw i32 %51, %45
  %53 = add nsw i32 %40, %23
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = sub nsw i32 %56, %36
  %58 = tail call i32 @llvm.abs.i32(i32 %57, i1 true)
  %59 = add nuw nsw i32 %52, %58
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !11, !amdgpu.noclobber !5
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !11, !amdgpu.noclobber !5
  %65 = fmul contract float %62, %64
  %66 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !11, !amdgpu.noclobber !5
  %68 = fmul contract float %65, %67
  %69 = fsub contract float %39, %68
  %70 = add nsw i32 %40, %6
  %71 = icmp slt i32 %70, %5
  br i1 %71, label %38, label %72, !llvm.loop !13

72:                                               ; preds = %38, %25
  %73 = phi float [ 0.000000e+00, %25 ], [ %69, %38 ]
  %74 = fdiv contract float %73, %7
  %75 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !11, !amdgpu.noclobber !5
  %77 = fadd contract float %74, %76
  %78 = icmp eq i32 %22, 0
  br i1 %78, label %79, label %81

79:                                               ; preds = %72
  %80 = getelementptr inbounds float, float addrspace(1)* %4, i64 %26
  store float %77, float addrspace(1)* %80, align 4, !tbaa !11
  br label %81

81:                                               ; preds = %72, %79, %8
  %82 = phi float [ %77, %79 ], [ %77, %72 ], [ 0.000000e+00, %8 ]
  %83 = icmp sgt i32 %6, 1
  br i1 %83, label %84, label %97

84:                                               ; preds = %81
  %85 = sext i32 %20 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %85
  br label %87

87:                                               ; preds = %84, %94
  %88 = phi i32 [ 1, %84 ], [ %95, %94 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = icmp ne i32 %22, %88
  %90 = select i1 %89, i1 true, i1 %24
  br i1 %90, label %94, label %91

91:                                               ; preds = %87
  %92 = load float, float addrspace(1)* %86, align 4, !tbaa !11
  %93 = fadd contract float %82, %92
  store float %93, float addrspace(1)* %86, align 4, !tbaa !11
  br label %94

94:                                               ; preds = %87, %91
  %95 = add nuw nsw i32 %88, 1
  %96 = icmp eq i32 %95, %6
  br i1 %96, label %97, label %87, !llvm.loop !15

97:                                               ; preds = %94, %81
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
