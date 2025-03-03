; ModuleID = '../data/hip_kernels/3007/206/main.cu'
source_filename = "../data/hip_kernels/3007/206/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8uplo_eluiiifPKfiiPfii(i32 %0, i32 %1, i32 %2, float %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %19, %0
  %29 = icmp slt i32 %27, %0
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %76

31:                                               ; preds = %10
  %32 = icmp eq i32 %1, 132
  %33 = mul nsw i32 %19, %2
  %34 = mul nsw i32 %27, %2
  %35 = icmp sgt i32 %33, %34
  %36 = icmp sge i32 %33, %34
  %37 = select i1 %32, i1 %35, i1 %36
  br i1 %37, label %38, label %76

38:                                               ; preds = %31
  %39 = add nsw i32 %19, %5
  %40 = mul nsw i32 %27, %6
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %4, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = fmul float %44, 0x3FF7154760000000
  %46 = tail call float @llvm.rint.f32(float %45)
  %47 = fneg float %46
  %48 = tail call float @llvm.fma.f32(float %47, float 0x3FE62E4300000000, float %44)
  %49 = tail call float @llvm.fma.f32(float %47, float 0xBE205C6100000000, float %48)
  %50 = tail call float @llvm.fmuladd.f32(float %49, float 0x3F2A267620000000, float 0x3F56D2E000000000)
  %51 = tail call float @llvm.fmuladd.f32(float %49, float %50, float 0x3F8110FF20000000)
  %52 = tail call float @llvm.fmuladd.f32(float %49, float %51, float 0x3FA5555020000000)
  %53 = tail call float @llvm.fmuladd.f32(float %49, float %52, float 0x3FC5555560000000)
  %54 = tail call float @llvm.fmuladd.f32(float %49, float %53, float 5.000000e-01)
  %55 = fmul float %49, %54
  %56 = tail call float @llvm.fma.f32(float %49, float %55, float %49)
  %57 = fcmp oeq float %46, 1.280000e+02
  %58 = fptosi float %46 to i32
  %59 = select i1 %57, i32 127, i32 %58
  %60 = tail call float @llvm.amdgcn.ldexp.f32(float 1.000000e+00, i32 %59)
  %61 = fadd float %60, -1.000000e+00
  %62 = tail call float @llvm.fma.f32(float %60, float %56, float %61)
  %63 = fmul float %62, 2.000000e+00
  %64 = select i1 %57, float %63, float %62
  %65 = fcmp ogt float %44, 0x40562E42E0000000
  %66 = select i1 %65, float 0x7FF0000000000000, float %64
  %67 = fcmp olt float %44, -1.700000e+01
  %68 = select i1 %67, float -1.000000e+00, float %66
  %69 = fmul contract float %68, %3
  %70 = tail call float @llvm.maxnum.f32(float %44, float %69)
  %71 = add nsw i32 %19, %8
  %72 = mul nsw i32 %27, %9
  %73 = add nsw i32 %71, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %7, i64 %74
  store float %70, float addrspace(1)* %75, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %10, %38, %31
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
