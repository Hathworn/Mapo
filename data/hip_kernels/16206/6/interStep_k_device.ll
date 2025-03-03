; ModuleID = '../data/hip_kernels/16206/6/main.cu'
source_filename = "../data/hip_kernels/16206/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11interStep_kPfmffmmf(float addrspace(1)* nocapture %0, i64 %1, float %2, float %3, i64 %4, i64 %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = zext i32 %8 to i64
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = zext i32 %10 to i64
  %12 = tail call i64 @llvm.usub.sat.i64(i64 %4, i64 %1)
  %13 = uitofp i32 %8 to float
  %14 = fmul contract float %13, %2
  %15 = fmul float %14, 0x3FF7154760000000
  %16 = tail call float @llvm.rint.f32(float %15)
  %17 = fcmp ogt float %14, 0x40562E4300000000
  %18 = fcmp olt float %14, 0xC059D1DA00000000
  %19 = fneg float %15
  %20 = tail call float @llvm.fma.f32(float %14, float 0x3FF7154760000000, float %19)
  %21 = tail call float @llvm.fma.f32(float %14, float 0x3E54AE0BE0000000, float %20)
  %22 = fsub float %15, %16
  %23 = fadd float %21, %22
  %24 = tail call float @llvm.exp2.f32(float %23)
  %25 = fptosi float %16 to i32
  %26 = tail call float @llvm.amdgcn.ldexp.f32(float %24, i32 %25)
  %27 = select i1 %18, float 0.000000e+00, float %26
  %28 = select i1 %17, float 0x7FF0000000000000, float %27
  %29 = fmul contract float %28, %3
  %30 = icmp eq i64 %11, %5
  br i1 %30, label %31, label %53

31:                                               ; preds = %7
  %32 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %33 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 12
  %34 = bitcast i8 addrspace(4)* %33 to i32 addrspace(4)*
  %35 = load i32, i32 addrspace(4)* %34, align 4, !tbaa !5
  %36 = getelementptr i8, i8 addrspace(4)* %32, i64 4
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4, !range !14, !invariant.load !15
  %39 = zext i16 %38 to i32
  %40 = udiv i32 %35, %39
  %41 = mul i32 %40, %39
  %42 = icmp ugt i32 %35, %41
  %43 = zext i1 %42 to i32
  %44 = add i32 %40, %43
  %45 = zext i32 %44 to i64
  %46 = mul i64 %45, %5
  %47 = add i64 %46, %9
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16, !amdgpu.noclobber !15
  %50 = fcmp contract oge float %29, %6
  %51 = uitofp i1 %50 to float
  %52 = fmul contract float %49, %51
  br label %112

53:                                               ; preds = %7
  %54 = icmp ule i64 %12, %11
  %55 = icmp ult i64 %11, %5
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %57, label %88

57:                                               ; preds = %53
  %58 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %58, i64 12
  %60 = bitcast i8 addrspace(4)* %59 to i32 addrspace(4)*
  %61 = load i32, i32 addrspace(4)* %60, align 4, !tbaa !5
  %62 = getelementptr i8, i8 addrspace(4)* %58, i64 4
  %63 = bitcast i8 addrspace(4)* %62 to i16 addrspace(4)*
  %64 = load i16, i16 addrspace(4)* %63, align 4, !range !14, !invariant.load !15
  %65 = zext i16 %64 to i32
  %66 = udiv i32 %61, %65
  %67 = mul i32 %66, %65
  %68 = icmp ugt i32 %61, %67
  %69 = zext i1 %68 to i32
  %70 = add i32 %66, %69
  %71 = zext i32 %70 to i64
  %72 = mul nuw nsw i64 %71, %11
  %73 = add nuw nsw i64 %72, %9
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16, !amdgpu.noclobber !15
  %76 = fcmp contract oge float %29, %6
  %77 = uitofp i1 %76 to float
  %78 = fmul contract float %75, %77
  %79 = add nuw nsw i64 %11, 1
  %80 = mul nuw nsw i64 %79, %71
  %81 = add nuw nsw i64 %80, %9
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !15
  %84 = fcmp contract olt float %29, %6
  %85 = uitofp i1 %84 to float
  %86 = fmul contract float %83, %85
  %87 = fadd contract float %78, %86
  br label %112

88:                                               ; preds = %53
  %89 = icmp eq i64 %12, %11
  %90 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br i1 %89, label %91, label %112

91:                                               ; preds = %88
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %90, i64 12
  %93 = bitcast i8 addrspace(4)* %92 to i32 addrspace(4)*
  %94 = load i32, i32 addrspace(4)* %93, align 4, !tbaa !5
  %95 = getelementptr i8, i8 addrspace(4)* %90, i64 4
  %96 = bitcast i8 addrspace(4)* %95 to i16 addrspace(4)*
  %97 = load i16, i16 addrspace(4)* %96, align 4, !range !14, !invariant.load !15
  %98 = zext i16 %97 to i32
  %99 = udiv i32 %94, %98
  %100 = mul i32 %99, %98
  %101 = icmp ugt i32 %94, %100
  %102 = zext i1 %101 to i32
  %103 = add i32 %99, %102
  %104 = zext i32 %103 to i64
  %105 = mul nuw nsw i64 %11, %104
  %106 = add nuw nsw i64 %105, %9
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16, !amdgpu.noclobber !15
  %109 = fcmp contract olt float %29, %6
  %110 = uitofp i1 %109 to float
  %111 = fmul contract float %108, %110
  br label %112

112:                                              ; preds = %88, %57, %91, %31
  %113 = phi i8 addrspace(4)* [ %58, %57 ], [ %90, %91 ], [ %32, %31 ], [ %90, %88 ]
  %114 = phi float [ %87, %57 ], [ %111, %91 ], [ %52, %31 ], [ 0.000000e+00, %88 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %113, i64 12
  %116 = bitcast i8 addrspace(4)* %115 to i32 addrspace(4)*
  %117 = load i32, i32 addrspace(4)* %116, align 4, !tbaa !5
  %118 = getelementptr i8, i8 addrspace(4)* %113, i64 4
  %119 = bitcast i8 addrspace(4)* %118 to i16 addrspace(4)*
  %120 = load i16, i16 addrspace(4)* %119, align 4, !range !14, !invariant.load !15
  %121 = zext i16 %120 to i32
  %122 = udiv i32 %117, %121
  %123 = mul i32 %122, %121
  %124 = icmp ugt i32 %117, %123
  %125 = zext i1 %124 to i32
  %126 = add i32 %122, %125
  %127 = zext i32 %126 to i64
  %128 = mul nuw nsw i64 %127, %11
  %129 = add nuw nsw i64 %128, %9
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  store float %114, float addrspace(1)* %130, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.usub.sat.i64(i64, i64) #4

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
