; ModuleID = '../data/hip_kernels/937/0/main.cu'
source_filename = "../data/hip_kernels/937/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15hsl2rgb_gpu_sonPfS_PhS0_S0_S0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3, i8 addrspace(1)* nocapture writeonly %4, i8 addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %6
  br i1 %17, label %18, label %138

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !6
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %19
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !11, !amdgpu.noclobber !6
  %26 = uitofp i8 %25 to float
  %27 = fdiv contract float %26, 2.550000e+02
  %28 = fcmp contract oeq float %23, 0.000000e+00
  br i1 %28, label %29, label %32

29:                                               ; preds = %18
  %30 = fmul contract float %27, 2.550000e+02
  %31 = fptoui float %30 to i8
  br label %131

32:                                               ; preds = %18
  %33 = fcmp contract olt float %27, 5.000000e-01
  %34 = fadd contract float %23, 1.000000e+00
  %35 = fmul contract float %34, %27
  %36 = fadd contract float %23, %27
  %37 = fmul contract float %23, %27
  %38 = fsub contract float %36, %37
  %39 = select i1 %33, float %35, float %38
  %40 = fmul contract float %27, 2.000000e+00
  %41 = fsub contract float %40, %39
  %42 = fadd contract float %21, 0x3FD5555560000000
  %43 = fcmp contract olt float %42, 0.000000e+00
  %44 = fadd contract float %42, 1.000000e+00
  %45 = select i1 %43, float %44, float %42
  %46 = fcmp contract ogt float %45, 1.000000e+00
  %47 = fadd contract float %45, -1.000000e+00
  %48 = select i1 %46, float %47, float %45
  %49 = fmul contract float %48, 6.000000e+00
  %50 = fcmp contract olt float %49, 1.000000e+00
  br i1 %50, label %51, label %56

51:                                               ; preds = %32
  %52 = fsub contract float %39, %41
  %53 = fmul contract float %52, 6.000000e+00
  %54 = fmul contract float %48, %53
  %55 = fadd contract float %41, %54
  br label %68

56:                                               ; preds = %32
  %57 = fmul contract float %48, 2.000000e+00
  %58 = fcmp contract olt float %57, 1.000000e+00
  br i1 %58, label %68, label %59

59:                                               ; preds = %56
  %60 = fmul contract float %48, 3.000000e+00
  %61 = fcmp contract olt float %60, 2.000000e+00
  %62 = fsub contract float %39, %41
  %63 = fsub contract float 0x3FE5555560000000, %48
  %64 = fmul contract float %63, %62
  %65 = fmul contract float %64, 6.000000e+00
  %66 = select i1 %61, float %65, float -0.000000e+00
  %67 = fadd contract float %41, %66
  br label %68

68:                                               ; preds = %51, %56, %59
  %69 = phi float [ %55, %51 ], [ %39, %56 ], [ %67, %59 ]
  %70 = fmul contract float %69, 2.550000e+02
  %71 = fptoui float %70 to i8
  %72 = fcmp contract olt float %21, 0.000000e+00
  %73 = fadd contract float %21, 1.000000e+00
  %74 = select i1 %72, float %73, float %21
  %75 = fcmp contract ogt float %74, 1.000000e+00
  %76 = fadd contract float %74, -1.000000e+00
  %77 = select i1 %75, float %76, float %74
  %78 = fmul contract float %77, 6.000000e+00
  %79 = fcmp contract olt float %78, 1.000000e+00
  br i1 %79, label %80, label %85

80:                                               ; preds = %68
  %81 = fsub contract float %39, %41
  %82 = fmul contract float %81, 6.000000e+00
  %83 = fmul contract float %77, %82
  %84 = fadd contract float %41, %83
  br label %97

85:                                               ; preds = %68
  %86 = fmul contract float %77, 2.000000e+00
  %87 = fcmp contract olt float %86, 1.000000e+00
  br i1 %87, label %97, label %88

88:                                               ; preds = %85
  %89 = fmul contract float %77, 3.000000e+00
  %90 = fcmp contract olt float %89, 2.000000e+00
  %91 = fsub contract float %39, %41
  %92 = fsub contract float 0x3FE5555560000000, %77
  %93 = fmul contract float %92, %91
  %94 = fmul contract float %93, 6.000000e+00
  %95 = select i1 %90, float %94, float -0.000000e+00
  %96 = fadd contract float %41, %95
  br label %97

97:                                               ; preds = %80, %85, %88
  %98 = phi float [ %84, %80 ], [ %39, %85 ], [ %96, %88 ]
  %99 = fmul contract float %98, 2.550000e+02
  %100 = fptoui float %99 to i8
  %101 = fadd contract float %21, 0xBFD5555560000000
  %102 = fcmp contract olt float %101, 0.000000e+00
  %103 = fadd contract float %101, 1.000000e+00
  %104 = select i1 %102, float %103, float %101
  %105 = fcmp contract ogt float %104, 1.000000e+00
  %106 = fadd contract float %104, -1.000000e+00
  %107 = select i1 %105, float %106, float %104
  %108 = fmul contract float %107, 6.000000e+00
  %109 = fcmp contract olt float %108, 1.000000e+00
  br i1 %109, label %110, label %115

110:                                              ; preds = %97
  %111 = fsub contract float %39, %41
  %112 = fmul contract float %111, 6.000000e+00
  %113 = fmul contract float %107, %112
  %114 = fadd contract float %41, %113
  br label %127

115:                                              ; preds = %97
  %116 = fmul contract float %107, 2.000000e+00
  %117 = fcmp contract olt float %116, 1.000000e+00
  br i1 %117, label %127, label %118

118:                                              ; preds = %115
  %119 = fmul contract float %107, 3.000000e+00
  %120 = fcmp contract olt float %119, 2.000000e+00
  %121 = fsub contract float %39, %41
  %122 = fsub contract float 0x3FE5555560000000, %107
  %123 = fmul contract float %122, %121
  %124 = fmul contract float %123, 6.000000e+00
  %125 = select i1 %120, float %124, float -0.000000e+00
  %126 = fadd contract float %41, %125
  br label %127

127:                                              ; preds = %110, %115, %118
  %128 = phi float [ %114, %110 ], [ %39, %115 ], [ %126, %118 ]
  %129 = fmul contract float %128, 2.550000e+02
  %130 = fptoui float %129 to i8
  br label %131

131:                                              ; preds = %127, %29
  %132 = phi i8 [ %31, %29 ], [ %71, %127 ]
  %133 = phi i8 [ %31, %29 ], [ %100, %127 ]
  %134 = phi i8 [ %31, %29 ], [ %130, %127 ]
  %135 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %19
  store i8 %132, i8 addrspace(1)* %135, align 1, !tbaa !11
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %19
  store i8 %133, i8 addrspace(1)* %136, align 1, !tbaa !11
  %137 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %19
  store i8 %134, i8 addrspace(1)* %137, align 1, !tbaa !11
  br label %138

138:                                              ; preds = %7, %131
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
