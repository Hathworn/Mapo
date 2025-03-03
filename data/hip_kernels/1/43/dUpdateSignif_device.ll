; ModuleID = '../data/hip_kernels/1/43/main.cu'
source_filename = "../data/hip_kernels/1/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__const._Z14dIsSignificantfi.tcutoffs = private unnamed_addr addrspace(4) constant [49 x float] [float 6.370000e+02, float 0x403F9999A0000000, float 0x40075C2900000000, float 0x40213851E0000000, float 0x401B79DB20000000, float 0x4017D60420000000, float 0x4015A1CAC0000000, float 0x401429FBE0000000, float 0x40131FBE80000000, float 0x4012591680000000, float 0x4011BF7CE0000000, float 0x401145A1C0000000, float 0x4010E24DE0000000, float 0x40108F5C20000000, float 0x40104AC080000000, float 0x40100F5C20000000, float 0x400FB851E0000000, float 0x400F604180000000, float 0x400F106240000000, float 0x400ECCCCC0000000, float 0x400E8D4FE0000000, float 0x400E560420000000, float 0x400E24DD20000000, float 0x400DF5C280000000, float 0x400DCCCCC0000000, float 0x400DA7EFA0000000, float 0x400D851EC0000000, float 0x400D645A20000000, float 0x400D45A1C0000000, float 0x400D2B0200000000, float 0x400CF9DB20000000, float 0x400CCED920000000, float 0x400CA7EFA0000000, float 0x400C872B00000000, float 0x400C6872C0000000, float 0x400C4DD300000000, float 0x400C353F80000000, float 0x400C1EB860000000, float 0x400C0A3D80000000, float 0x400BF7CEE0000000, float 0x400BCED920000000, float 0x400BAE1480000000, float 0x400B9374C0000000, float 0x400B7AE140000000, float 0x400B53F7C0000000, float 0x400B1EB860000000, float 0x400ADB22E0000000, float 0x400AB851E0000000, float 0x400A51EB80000000], align 16

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13dUpdateSignifPKfmPf(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = zext i32 %4 to i64
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = shl nuw nsw i64 %5, 9
  %8 = shl nuw nsw i32 %6, 5
  %9 = zext i32 %8 to i64
  %10 = add nuw nsw i64 %7, %9
  br label %11

11:                                               ; preds = %3, %119
  %12 = phi i64 [ 0, %3 ], [ %123, %119 ]
  %13 = add nuw nsw i64 %10, %12
  %14 = icmp ugt i64 %13, %1
  br i1 %14, label %125, label %15

15:                                               ; preds = %11
  %16 = mul i64 %13, 5
  %17 = mul i64 %13, 6
  %18 = add nuw nsw i64 %16, 3
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5
  %21 = add nuw nsw i64 %16, 4
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !5
  %24 = fpext float %20 to double
  %25 = fcmp contract ult double %24, 0x3FEFF7CED916872B
  br i1 %25, label %26, label %53

26:                                               ; preds = %15
  %27 = fadd contract float %23, -2.000000e+00
  %28 = fmul contract float %20, %20
  %29 = fsub contract float 1.000000e+00, %28
  %30 = fdiv contract float %27, %29
  %31 = fcmp olt float %30, 0x39F0000000000000
  %32 = select i1 %31, float 0x41F0000000000000, float 1.000000e+00
  %33 = fmul float %30, %32
  %34 = tail call float @llvm.sqrt.f32(float %33)
  %35 = bitcast float %34 to i32
  %36 = add nsw i32 %35, -1
  %37 = bitcast i32 %36 to float
  %38 = add nsw i32 %35, 1
  %39 = bitcast i32 %38 to float
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %33, i32 608)
  %41 = select i1 %31, float 0x3EF0000000000000, float 1.000000e+00
  %42 = fneg float %39
  %43 = tail call float @llvm.fma.f32(float %42, float %34, float %33)
  %44 = fcmp ogt float %43, 0.000000e+00
  %45 = fneg float %37
  %46 = tail call float @llvm.fma.f32(float %45, float %34, float %33)
  %47 = fcmp ole float %46, 0.000000e+00
  %48 = select i1 %47, float %37, float %34
  %49 = select i1 %44, float %39, float %48
  %50 = fmul float %41, %49
  %51 = select i1 %40, float %33, float %50
  %52 = fmul contract float %20, %51
  br label %53

53:                                               ; preds = %15, %26
  %54 = phi float [ %52, %26 ], [ 1.000000e+04, %15 ]
  %55 = fptosi float %23 to i32
  %56 = icmp slt i32 %55, 1
  br i1 %56, label %97, label %57

57:                                               ; preds = %53
  %58 = icmp ult i32 %55, 31
  br i1 %58, label %59, label %61

59:                                               ; preds = %57
  %60 = add nsw i32 %55, -1
  br label %89

61:                                               ; preds = %57
  %62 = icmp ult i32 %55, 51
  br i1 %62, label %63, label %71

63:                                               ; preds = %61
  %64 = and i32 %55, 1
  %65 = add nuw nsw i32 %64, %55
  %66 = trunc i32 %65 to i8
  %67 = add nsw i8 %66, -32
  %68 = sdiv i8 %67, 2
  %69 = add nuw nsw i8 %68, 30
  %70 = zext i8 %69 to i32
  br label %89

71:                                               ; preds = %61
  %72 = icmp ult i32 %55, 71
  br i1 %72, label %73, label %80

73:                                               ; preds = %71
  %74 = icmp ult i32 %55, 56
  %75 = icmp ult i32 %55, 61
  %76 = icmp ult i32 %55, 66
  %77 = select i1 %76, i32 42, i32 43
  %78 = select i1 %75, i32 41, i32 %77
  %79 = select i1 %74, i32 40, i32 %78
  br label %89

80:                                               ; preds = %71
  %81 = icmp ult i32 %55, 81
  br i1 %81, label %89, label %82

82:                                               ; preds = %80
  %83 = icmp ult i32 %55, 101
  %84 = icmp ult i32 %55, 151
  %85 = icmp ult i32 %55, 201
  %86 = select i1 %85, i32 47, i32 48
  %87 = select i1 %84, i32 46, i32 %86
  %88 = select i1 %83, i32 45, i32 %87
  br label %89

89:                                               ; preds = %82, %73, %80, %63, %59
  %90 = phi i32 [ %60, %59 ], [ %70, %63 ], [ 44, %80 ], [ %79, %73 ], [ %88, %82 ]
  %91 = tail call float @llvm.fabs.f32(float %54)
  %92 = zext i32 %90 to i64
  %93 = getelementptr [49 x float], [49 x float] addrspace(4)* @__const._Z14dIsSignificantfi.tcutoffs, i64 0, i64 %92
  %94 = load float, float addrspace(4)* %93, align 4, !tbaa !5
  %95 = fcmp contract uge float %91, %94
  %96 = zext i1 %95 to i32
  br label %97

97:                                               ; preds = %53, %89
  %98 = phi i32 [ 0, %53 ], [ %96, %89 ]
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %119, label %100

100:                                              ; preds = %97
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  store float %102, float addrspace(1)* %103, align 4, !tbaa !5
  %104 = add nuw nsw i64 %16, 1
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = or i64 %17, 1
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  store float %106, float addrspace(1)* %108, align 4, !tbaa !5
  %109 = add nuw nsw i64 %16, 2
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !5
  %112 = add nuw nsw i64 %17, 2
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  store float %111, float addrspace(1)* %113, align 4, !tbaa !5
  %114 = add nuw nsw i64 %17, 3
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  store float %20, float addrspace(1)* %115, align 4, !tbaa !5
  %116 = add nuw nsw i64 %17, 4
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  store float %54, float addrspace(1)* %117, align 4, !tbaa !5
  %118 = add nuw nsw i64 %17, 5
  br label %119

119:                                              ; preds = %97, %100
  %120 = phi i64 [ %118, %100 ], [ %17, %97 ]
  %121 = phi float [ %23, %100 ], [ -1.000000e+00, %97 ]
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  store float %121, float addrspace(1)* %122, align 4, !tbaa !5
  %123 = add nuw nsw i64 %12, 1
  %124 = icmp eq i64 %123, 32
  br i1 %124, label %125, label %11, !llvm.loop !9

125:                                              ; preds = %11, %119
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
