; ModuleID = '../data/hip_kernels/13872/3/main.cu'
source_filename = "../data/hip_kernels/13872/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12SimpleKerneliPf(i32 %0, float addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp slt i32 %11, %0
  br i1 %12, label %13, label %132

13:                                               ; preds = %2
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  br label %17

17:                                               ; preds = %17, %13
  %18 = phi i32 [ 0, %13 ], [ %129, %17 ]
  %19 = phi float [ %16, %13 ], [ %128, %17 ]
  %20 = sitofp i32 %18 to float
  %21 = fadd contract float %19, %20
  %22 = tail call float @llvm.fabs.f32(float %21)
  %23 = tail call float @llvm.fmuladd.f32(float %22, float -5.000000e-01, float 5.000000e-01)
  %24 = fmul float %21, %21
  %25 = fcmp oge float %22, 5.000000e-01
  %26 = select i1 %25, float %23, float %24
  %27 = tail call float @llvm.fmuladd.f32(float %26, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %28 = tail call float @llvm.fmuladd.f32(float %26, float %27, float 0x3FA0698780000000)
  %29 = tail call float @llvm.fmuladd.f32(float %26, float %28, float 0x3FA6C83620000000)
  %30 = tail call float @llvm.fmuladd.f32(float %26, float %29, float 0x3FB3337900000000)
  %31 = tail call float @llvm.fmuladd.f32(float %26, float %30, float 0x3FC5555580000000)
  %32 = fmul float %26, %31
  %33 = tail call float @llvm.sqrt.f32(float %26)
  %34 = tail call float @llvm.fmuladd.f32(float %33, float %32, float %33)
  %35 = fmul float %34, 2.000000e+00
  %36 = fsub float 0x3FF921FB60000000, %35
  %37 = tail call float @llvm.fmuladd.f32(float %22, float %32, float %22)
  %38 = fcmp olt float %22, 5.000000e-01
  %39 = select i1 %38, float %37, float %36
  %40 = tail call float @llvm.copysign.f32(float %39, float %21)
  %41 = add nuw nsw i32 %18, 1
  %42 = sitofp i32 %41 to float
  %43 = fadd contract float %40, %42
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = tail call float @llvm.fmuladd.f32(float %44, float -5.000000e-01, float 5.000000e-01)
  %46 = fmul float %43, %43
  %47 = fcmp oge float %44, 5.000000e-01
  %48 = select i1 %47, float %45, float %46
  %49 = tail call float @llvm.fmuladd.f32(float %48, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %50 = tail call float @llvm.fmuladd.f32(float %48, float %49, float 0x3FA0698780000000)
  %51 = tail call float @llvm.fmuladd.f32(float %48, float %50, float 0x3FA6C83620000000)
  %52 = tail call float @llvm.fmuladd.f32(float %48, float %51, float 0x3FB3337900000000)
  %53 = tail call float @llvm.fmuladd.f32(float %48, float %52, float 0x3FC5555580000000)
  %54 = fmul float %48, %53
  %55 = tail call float @llvm.sqrt.f32(float %48)
  %56 = tail call float @llvm.fmuladd.f32(float %55, float %54, float %55)
  %57 = fmul float %56, 2.000000e+00
  %58 = fsub float 0x3FF921FB60000000, %57
  %59 = tail call float @llvm.fmuladd.f32(float %44, float %54, float %44)
  %60 = fcmp olt float %44, 5.000000e-01
  %61 = select i1 %60, float %59, float %58
  %62 = tail call float @llvm.copysign.f32(float %61, float %43)
  %63 = add nuw nsw i32 %18, 2
  %64 = sitofp i32 %63 to float
  %65 = fadd contract float %62, %64
  %66 = tail call float @llvm.fabs.f32(float %65)
  %67 = tail call float @llvm.fmuladd.f32(float %66, float -5.000000e-01, float 5.000000e-01)
  %68 = fmul float %65, %65
  %69 = fcmp oge float %66, 5.000000e-01
  %70 = select i1 %69, float %67, float %68
  %71 = tail call float @llvm.fmuladd.f32(float %70, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %72 = tail call float @llvm.fmuladd.f32(float %70, float %71, float 0x3FA0698780000000)
  %73 = tail call float @llvm.fmuladd.f32(float %70, float %72, float 0x3FA6C83620000000)
  %74 = tail call float @llvm.fmuladd.f32(float %70, float %73, float 0x3FB3337900000000)
  %75 = tail call float @llvm.fmuladd.f32(float %70, float %74, float 0x3FC5555580000000)
  %76 = fmul float %70, %75
  %77 = tail call float @llvm.sqrt.f32(float %70)
  %78 = tail call float @llvm.fmuladd.f32(float %77, float %76, float %77)
  %79 = fmul float %78, 2.000000e+00
  %80 = fsub float 0x3FF921FB60000000, %79
  %81 = tail call float @llvm.fmuladd.f32(float %66, float %76, float %66)
  %82 = fcmp olt float %66, 5.000000e-01
  %83 = select i1 %82, float %81, float %80
  %84 = tail call float @llvm.copysign.f32(float %83, float %65)
  %85 = add nuw nsw i32 %18, 3
  %86 = sitofp i32 %85 to float
  %87 = fadd contract float %84, %86
  %88 = tail call float @llvm.fabs.f32(float %87)
  %89 = tail call float @llvm.fmuladd.f32(float %88, float -5.000000e-01, float 5.000000e-01)
  %90 = fmul float %87, %87
  %91 = fcmp oge float %88, 5.000000e-01
  %92 = select i1 %91, float %89, float %90
  %93 = tail call float @llvm.fmuladd.f32(float %92, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %94 = tail call float @llvm.fmuladd.f32(float %92, float %93, float 0x3FA0698780000000)
  %95 = tail call float @llvm.fmuladd.f32(float %92, float %94, float 0x3FA6C83620000000)
  %96 = tail call float @llvm.fmuladd.f32(float %92, float %95, float 0x3FB3337900000000)
  %97 = tail call float @llvm.fmuladd.f32(float %92, float %96, float 0x3FC5555580000000)
  %98 = fmul float %92, %97
  %99 = tail call float @llvm.sqrt.f32(float %92)
  %100 = tail call float @llvm.fmuladd.f32(float %99, float %98, float %99)
  %101 = fmul float %100, 2.000000e+00
  %102 = fsub float 0x3FF921FB60000000, %101
  %103 = tail call float @llvm.fmuladd.f32(float %88, float %98, float %88)
  %104 = fcmp olt float %88, 5.000000e-01
  %105 = select i1 %104, float %103, float %102
  %106 = tail call float @llvm.copysign.f32(float %105, float %87)
  %107 = add nuw nsw i32 %18, 4
  %108 = sitofp i32 %107 to float
  %109 = fadd contract float %106, %108
  %110 = tail call float @llvm.fabs.f32(float %109)
  %111 = tail call float @llvm.fmuladd.f32(float %110, float -5.000000e-01, float 5.000000e-01)
  %112 = fmul float %109, %109
  %113 = fcmp oge float %110, 5.000000e-01
  %114 = select i1 %113, float %111, float %112
  %115 = tail call float @llvm.fmuladd.f32(float %114, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %116 = tail call float @llvm.fmuladd.f32(float %114, float %115, float 0x3FA0698780000000)
  %117 = tail call float @llvm.fmuladd.f32(float %114, float %116, float 0x3FA6C83620000000)
  %118 = tail call float @llvm.fmuladd.f32(float %114, float %117, float 0x3FB3337900000000)
  %119 = tail call float @llvm.fmuladd.f32(float %114, float %118, float 0x3FC5555580000000)
  %120 = fmul float %114, %119
  %121 = tail call float @llvm.sqrt.f32(float %114)
  %122 = tail call float @llvm.fmuladd.f32(float %121, float %120, float %121)
  %123 = fmul float %122, 2.000000e+00
  %124 = fsub float 0x3FF921FB60000000, %123
  %125 = tail call float @llvm.fmuladd.f32(float %110, float %120, float %110)
  %126 = fcmp olt float %110, 5.000000e-01
  %127 = select i1 %126, float %125, float %124
  %128 = tail call float @llvm.copysign.f32(float %127, float %109)
  %129 = add nuw nsw i32 %18, 5
  %130 = icmp eq i32 %129, 1000
  br i1 %130, label %131, label %17, !llvm.loop !11

131:                                              ; preds = %17
  store float %128, float addrspace(1)* %15, align 4, !tbaa !7
  br label %132

132:                                              ; preds = %131, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
