; ModuleID = '../data/hip_kernels/12549/0/main.cu'
source_filename = "../data/hip_kernels/12549/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@lTable_const = protected addrspace(4) externally_initialized global [1064 x float] zeroinitializer, align 16
@mr_const = protected addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mg_const = protected addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@mb_const = protected addrspace(4) externally_initialized global [3 x float] zeroinitializer, align 4
@llvm.compiler.used = appending addrspace(1) global [4 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([1064 x float] addrspace(4)* @lTable_const to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast ([3 x float] addrspace(4)* @mb_const to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast ([3 x float] addrspace(4)* @mg_const to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast ([3 x float] addrspace(4)* @mr_const to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25convert_to_luv_gpu_kernelPhPfiib(i8 addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i1 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp ult i32 %14, %2
  %24 = icmp ult i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %98

26:                                               ; preds = %5
  %27 = mul i32 %22, %2
  %28 = add i32 %27, %14
  %29 = mul i32 %28, 3
  %30 = add i32 %29, 2
  %31 = select i1 %4, i32 %30, i32 %29
  %32 = select i1 %4, i32 %29, i32 %30
  %33 = zext i32 %31 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %33
  %35 = add i32 %29, 1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %36
  %38 = zext i32 %32 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !7, !amdgpu.noclobber !6
  %41 = uitofp i8 %40 to float
  %42 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !6
  %43 = uitofp i8 %42 to float
  %44 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !7, !amdgpu.noclobber !6
  %45 = uitofp i8 %44 to float
  %46 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @mr_const, i64 0, i64 0), align 4, !tbaa !10
  %47 = fmul contract float %46, %41
  %48 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @mg_const, i64 0, i64 0), align 4, !tbaa !10
  %49 = fmul contract float %48, %43
  %50 = fadd contract float %47, %49
  %51 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @mb_const, i64 0, i64 0), align 4, !tbaa !10
  %52 = fmul contract float %51, %45
  %53 = fadd contract float %50, %52
  %54 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @mr_const, i64 0, i64 1), align 4, !tbaa !10
  %55 = fmul contract float %54, %41
  %56 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @mg_const, i64 0, i64 1), align 4, !tbaa !10
  %57 = fmul contract float %56, %43
  %58 = fadd contract float %55, %57
  %59 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @mb_const, i64 0, i64 1), align 4, !tbaa !10
  %60 = fmul contract float %59, %45
  %61 = fadd contract float %58, %60
  %62 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @mr_const, i64 0, i64 2), align 4, !tbaa !10
  %63 = fmul contract float %62, %41
  %64 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @mg_const, i64 0, i64 2), align 4, !tbaa !10
  %65 = fmul contract float %64, %43
  %66 = fadd contract float %63, %65
  %67 = load float, float addrspace(4)* getelementptr inbounds ([3 x float], [3 x float] addrspace(4)* @mb_const, i64 0, i64 2), align 4, !tbaa !10
  %68 = fmul contract float %67, %45
  %69 = fadd contract float %66, %68
  %70 = fmul contract float %61, 1.024000e+03
  %71 = fptosi float %70 to i32
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [1064 x float], [1064 x float] addrspace(4)* @lTable_const, i64 0, i64 %72
  %74 = load float, float addrspace(4)* %73, align 4, !tbaa !10
  %75 = fmul contract float %61, 1.500000e+01
  %76 = fadd contract float %53, %75
  %77 = fmul contract float %69, 3.000000e+00
  %78 = fadd contract float %76, %77
  %79 = fadd contract float %78, 0x38AA95A5C0000000
  %80 = fdiv contract float 1.000000e+00, %79
  %81 = fmul contract float %53, 5.200000e+01
  %82 = fmul contract float %81, %80
  %83 = fadd contract float %82, 0xC004931B20000000
  %84 = fmul contract float %74, %83
  %85 = fadd contract float %84, 0x3FD4DBF860000000
  %86 = fmul contract float %61, 1.170000e+02
  %87 = fmul contract float %86, %80
  %88 = fadd contract float %87, 0xC0185A6C20000000
  %89 = fmul contract float %74, %88
  %90 = fadd contract float %89, 0x3FDFC35180000000
  %91 = zext i32 %29 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  store float %74, float addrspace(1)* %92, align 4, !tbaa !10
  %93 = add i32 %29, 1
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  store float %85, float addrspace(1)* %95, align 4, !tbaa !10
  %96 = zext i32 %30 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  store float %90, float addrspace(1)* %97, align 4, !tbaa !10
  br label %98

98:                                               ; preds = %26, %5
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
