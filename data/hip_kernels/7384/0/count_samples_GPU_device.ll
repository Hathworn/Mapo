; ModuleID = '../data/hip_kernels/7384/0/main.cu'
source_filename = "../data/hip_kernels/7384/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks = internal unnamed_addr addrspace(3) global [500 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17count_samples_GPUPfS_Piii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = mul i32 %12, %3
  %16 = icmp slt i32 %14, %4
  br i1 %16, label %26, label %17

17:                                               ; preds = %26, %5
  %18 = phi i32 [ 0, %5 ], [ %39, %26 ]
  %19 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %6
  store i32 %18, i32 addrspace(3)* %19, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp eq i32 %6, 0
  br i1 %20, label %21, label %99

21:                                               ; preds = %17
  %22 = and i32 %12, 7
  %23 = icmp ult i16 %11, 8
  br i1 %23, label %42, label %24

24:                                               ; preds = %21
  %25 = and i32 %12, 2040
  br label %61

26:                                               ; preds = %5, %26
  %27 = phi i32 [ %39, %26 ], [ 0, %5 ]
  %28 = phi i32 [ %40, %26 ], [ %14, %5 ]
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !11, !amdgpu.noclobber !6
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !11, !amdgpu.noclobber !6
  %34 = fmul contract float %31, %31
  %35 = fmul contract float %33, %33
  %36 = fadd contract float %34, %35
  %37 = fcmp contract ole float %36, 1.000000e+00
  %38 = zext i1 %37 to i32
  %39 = add nuw nsw i32 %27, %38
  %40 = add nsw i32 %28, %15
  %41 = icmp slt i32 %40, %4
  br i1 %41, label %26, label %17, !llvm.loop !13

42:                                               ; preds = %61, %21
  %43 = phi i32 [ undef, %21 ], [ %95, %61 ]
  %44 = phi i32 [ 0, %21 ], [ %96, %61 ]
  %45 = phi i32 [ 0, %21 ], [ %95, %61 ]
  %46 = icmp eq i32 %22, 0
  br i1 %46, label %57, label %47

47:                                               ; preds = %42, %47
  %48 = phi i32 [ %54, %47 ], [ %44, %42 ]
  %49 = phi i32 [ %53, %47 ], [ %45, %42 ]
  %50 = phi i32 [ %55, %47 ], [ 0, %42 ]
  %51 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %48
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !7
  %53 = add nsw i32 %52, %49
  %54 = add nuw nsw i32 %48, 1
  %55 = add i32 %50, 1
  %56 = icmp eq i32 %55, %22
  br i1 %56, label %57, label %47, !llvm.loop !15

57:                                               ; preds = %47, %42
  %58 = phi i32 [ %43, %42 ], [ %53, %47 ]
  %59 = zext i32 %7 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %59
  store i32 %58, i32 addrspace(1)* %60, align 4, !tbaa !7
  br label %99

61:                                               ; preds = %61, %24
  %62 = phi i32 [ 0, %24 ], [ %96, %61 ]
  %63 = phi i32 [ 0, %24 ], [ %95, %61 ]
  %64 = phi i32 [ 0, %24 ], [ %97, %61 ]
  %65 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %62
  %66 = load i32, i32 addrspace(3)* %65, align 16, !tbaa !7
  %67 = add nsw i32 %66, %63
  %68 = or i32 %62, 1
  %69 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %68
  %70 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !7
  %71 = add nsw i32 %70, %67
  %72 = or i32 %62, 2
  %73 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %72
  %74 = load i32, i32 addrspace(3)* %73, align 8, !tbaa !7
  %75 = add nsw i32 %74, %71
  %76 = or i32 %62, 3
  %77 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %76
  %78 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !7
  %79 = add nsw i32 %78, %75
  %80 = or i32 %62, 4
  %81 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %80
  %82 = load i32, i32 addrspace(3)* %81, align 16, !tbaa !7
  %83 = add nsw i32 %82, %79
  %84 = or i32 %62, 5
  %85 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %84
  %86 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !7
  %87 = add nsw i32 %86, %83
  %88 = or i32 %62, 6
  %89 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %88
  %90 = load i32, i32 addrspace(3)* %89, align 8, !tbaa !7
  %91 = add nsw i32 %90, %87
  %92 = or i32 %62, 7
  %93 = getelementptr inbounds [500 x i32], [500 x i32] addrspace(3)* @_ZZ17count_samples_GPUPfS_PiiiE13shared_blocks, i32 0, i32 %92
  %94 = load i32, i32 addrspace(3)* %93, align 4, !tbaa !7
  %95 = add nsw i32 %94, %91
  %96 = add nuw nsw i32 %62, 8
  %97 = add i32 %64, 8
  %98 = icmp eq i32 %97, %25
  br i1 %98, label %42, label %61, !llvm.loop !17

99:                                               ; preds = %57, %17
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
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
