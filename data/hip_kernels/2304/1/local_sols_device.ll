; ModuleID = '../data/hip_kernels/2304/1/main.cu'
source_filename = "../data/hip_kernels/2304/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp1 = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z10local_solsPfS_S_S_Pii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %5
  %25 = icmp ult i32 %23, %20
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %93

27:                                               ; preds = %6
  %28 = mul nuw nsw i32 %14, 15
  %29 = mul nsw i32 %15, 3
  %30 = add nsw i32 %29, %23
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = add nuw nsw i32 %28, 9
  %35 = add nsw i32 %34, %23
  %36 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %35
  store float %33, float addrspace(3)* %36, align 4, !tbaa !7
  %37 = mul nsw i32 %15, 9
  %38 = mul nsw i32 %23, 3
  %39 = add i32 %38, %37
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = add i32 %38, %28
  %44 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %43
  store float %42, float addrspace(3)* %44, align 4, !tbaa !7
  %45 = add i32 %38, 1
  %46 = add i32 %45, %37
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = add i32 %45, %28
  %51 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %50
  store float %49, float addrspace(3)* %51, align 4, !tbaa !7
  %52 = add i32 %38, 2
  %53 = add i32 %52, %37
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = add i32 %52, %28
  %58 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %57
  store float %56, float addrspace(3)* %58, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %31
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !11, !amdgpu.noclobber !5
  %61 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %62 = sext i32 %60 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %3, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = add nuw nsw i32 %28, 12
  %66 = add nsw i32 %23, %65
  %67 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %66
  store float %64, float addrspace(3)* %67, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = add nuw nsw i32 %23, 1
  %69 = srem i32 %68, 3
  %70 = add nsw i32 %43, %69
  %71 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %70
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !7
  %73 = add nsw i32 %69, %65
  %74 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %76 = fmul contract float %72, %75
  %77 = fsub contract float %61, %76
  %78 = add nsw i32 %23, 2
  %79 = srem i32 %78, 3
  %80 = add nsw i32 %43, %79
  %81 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !7
  %83 = add nsw i32 %79, %65
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %83
  %85 = load float, float addrspace(3)* %84, align 4, !tbaa !7
  %86 = fmul contract float %82, %85
  %87 = fsub contract float %77, %86
  %88 = add nsw i32 %43, %23
  %89 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp1, i32 0, i32 %88
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !7
  %91 = fdiv contract float %87, %90
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  store float %91, float addrspace(1)* %92, align 4, !tbaa !7
  br label %93

93:                                               ; preds = %27, %6
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
