; ModuleID = '../data/hip_kernels/8562/24/main.cu'
source_filename = "../data/hip_kernels/8562/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z2k0PfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = add i32 %13, 1
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = add i32 %22, 1
  %24 = add nsw i32 %3, -1
  %25 = icmp ult i32 %14, %24
  br i1 %25, label %26, label %93

26:                                               ; preds = %4
  %27 = icmp uge i32 %23, %24
  %28 = icmp eq i32 %14, 0
  %29 = select i1 %27, i1 true, i1 %28
  %30 = icmp eq i32 %23, 0
  %31 = or i1 %30, %29
  br i1 %31, label %93, label %32

32:                                               ; preds = %26
  %33 = mul i32 %14, %2
  %34 = add i32 %33, %23
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fmul contract float %37, 0x3FC99999A0000000
  %39 = mul i32 %13, %2
  %40 = add i32 %23, %39
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fmul contract float %43, 0x3FB99999A0000000
  %45 = fadd contract float %38, %44
  %46 = add nuw i32 %22, 2
  %47 = add i32 %46, %39
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fmul contract float %50, 0x3FB99999A0000000
  %52 = fadd contract float %45, %51
  %53 = add i32 %33, %46
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = fmul contract float %56, 0x3FB99999A0000000
  %58 = fadd contract float %52, %57
  %59 = add nuw i32 %13, 2
  %60 = mul i32 %59, %2
  %61 = add i32 %60, %46
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = fmul contract float %64, 0x3FB99999A0000000
  %66 = fadd contract float %58, %65
  %67 = add i32 %60, %23
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = fmul contract float %70, 0x3FB99999A0000000
  %72 = fadd contract float %66, %71
  %73 = add i32 %60, %22
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = fmul contract float %76, 0x3FB99999A0000000
  %78 = fadd contract float %72, %77
  %79 = add i32 %33, %22
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fmul contract float %82, 0x3FB99999A0000000
  %84 = fadd contract float %78, %83
  %85 = add i32 %39, %22
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract float %88, 0x3FB99999A0000000
  %90 = fadd contract float %84, %89
  %91 = fmul contract float %90, 0x3FEE666660000000
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  store float %91, float addrspace(1)* %92, align 4, !tbaa !7
  br label %93

93:                                               ; preds = %4, %26, %32
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
