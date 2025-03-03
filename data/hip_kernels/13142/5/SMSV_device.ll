; ModuleID = '../data/hip_kernels/13142/5/main.cu'
source_filename = "../data/hip_kernels/13142/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4SMSVPfS_S_PiS0_iE4psum = internal unnamed_addr addrspace(3) global [8 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4SMSVPfS_S_PiS0_i(float addrspace(1)* %0, float addrspace(1)* %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = icmp slt i32 %7, %5
  br i1 %8, label %9, label %66

9:                                                ; preds = %6
  %10 = addrspacecast float addrspace(1)* %1 to float*
  %11 = zext i32 %7 to i64
  %12 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ4SMSVPfS_S_PiS0_iE4psum, i32 0, i32 %7
  store i32 0, i32 addrspace(3)* %12, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = ptrtoint float* %10 to i64
  %15 = trunc i64 %14 to i32
  %16 = sub i32 %13, %15
  %17 = icmp slt i32 %16, -3
  br i1 %17, label %21, label %18

18:                                               ; preds = %9
  %19 = sdiv i32 %16, 4
  %20 = shl nuw nsw i32 %5, 1
  br label %25

21:                                               ; preds = %63, %9
  %22 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !5
  %23 = sitofp i32 %22 to float
  %24 = getelementptr inbounds float, float addrspace(1)* %2, i64 %11
  store float %23, float addrspace(1)* %24, align 4, !tbaa !10
  br label %66

25:                                               ; preds = %18, %63
  %26 = phi i32 [ 0, %18 ], [ %64, %63 ]
  %27 = add nsw i32 %26, %5
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !10, !amdgpu.noclobber !9
  %31 = fptosi float %30 to i32
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !9
  %35 = mul nsw i32 %20, %31
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = addrspacecast float addrspace(1)* %37 to float*
  %39 = ptrtoint float* %38 to i64
  %40 = trunc i64 %39 to i32
  %41 = sub i32 %34, %40
  %42 = sdiv i32 %41, 4
  %43 = icmp sgt i32 %7, %42
  br i1 %43, label %63, label %44

44:                                               ; preds = %25
  %45 = add nsw i32 %35, %7
  %46 = add nsw i32 %45, %5
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !10, !amdgpu.noclobber !9
  %50 = fptosi float %49 to i32
  %51 = sext i32 %45 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !10, !amdgpu.noclobber !9
  %54 = zext i32 %26 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !10, !amdgpu.noclobber !9
  %57 = fmul contract float %53, %56
  %58 = getelementptr inbounds [8 x i32], [8 x i32] addrspace(3)* @_ZZ4SMSVPfS_S_PiS0_iE4psum, i32 0, i32 %50
  %59 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !5
  %60 = sitofp i32 %59 to float
  %61 = fadd contract float %57, %60
  %62 = fptosi float %61 to i32
  store i32 %62, i32 addrspace(3)* %58, align 4, !tbaa !5
  br label %63

63:                                               ; preds = %44, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = add nuw nsw i32 %26, 1
  %65 = icmp eq i32 %26, %19
  br i1 %65, label %21, label %25, !llvm.loop !12

66:                                               ; preds = %21, %6
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
