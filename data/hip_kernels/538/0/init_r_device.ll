; ModuleID = '../data/hip_kernels/538/0/main.cu'
source_filename = "../data/hip_kernels/538/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z6init_rPfi(float addrspace(1)* nocapture writeonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %5, %9
  %11 = add i32 %10, %3
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = add i32 %18, %12
  %20 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %22 = getelementptr i8, i8 addrspace(4)* %4, i64 8
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %20
  %28 = mul i32 %27, %1
  %29 = add i32 %28, %19
  %30 = mul i32 %29, %1
  %31 = add i32 %30, %11
  %32 = icmp slt i32 %11, %1
  %33 = icmp slt i32 %19, %1
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %73

35:                                               ; preds = %2
  %36 = icmp slt i32 %27, %1
  %37 = icmp slt i32 %31, 343
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %39, label %73

39:                                               ; preds = %35
  %40 = shl nsw i32 %11, 1
  %41 = add nuw nsw i32 %40, 1
  %42 = sitofp i32 %41 to float
  %43 = sitofp i32 %1 to float
  %44 = fdiv contract float %42, %43
  %45 = fpext float %44 to double
  %46 = fsub contract double 1.000000e+00, %45
  %47 = fmul contract double %46, 5.250000e+00
  %48 = fptrunc double %47 to float
  %49 = sext i32 %31 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  store float %48, float addrspace(1)* %50, align 4, !tbaa !7
  %51 = shl nsw i32 %19, 1
  %52 = add nuw nsw i32 %51, 1
  %53 = sitofp i32 %52 to float
  %54 = fdiv contract float %53, %43
  %55 = fpext float %54 to double
  %56 = fsub contract double 1.000000e+00, %55
  %57 = fmul contract double %56, 5.250000e+00
  %58 = fptrunc double %57 to float
  %59 = add nsw i32 %31, 343
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  store float %58, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = shl nsw i32 %27, 1
  %63 = add nuw nsw i32 %62, 1
  %64 = sitofp i32 %63 to float
  %65 = fdiv contract float %64, %43
  %66 = fpext float %65 to double
  %67 = fsub contract double 1.000000e+00, %66
  %68 = fmul contract double %67, 5.250000e+00
  %69 = fptrunc double %68 to float
  %70 = add nsw i32 %31, 686
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  store float %69, float addrspace(1)* %72, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %39, %35, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
