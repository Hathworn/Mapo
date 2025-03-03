; ModuleID = '../data/hip_kernels/3007/180/main.cu'
source_filename = "../data/hip_kernels/3007/180/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9uplo_sinhiiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %0
  %28 = icmp slt i32 %26, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %169

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %169

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fadd float %44, 0xBFE62E4300000000
  %46 = fsub float %45, %44
  %47 = fsub float %46, %45
  %48 = fadd float %44, %47
  %49 = fadd float %46, 0x3FE62E4300000000
  %50 = fsub float %48, %49
  %51 = fadd float %50, 0x3E205C6100000000
  %52 = fadd float %45, %51
  %53 = fsub float %52, %45
  %54 = fsub float %51, %53
  %55 = fmul float %52, 0x3FF7154760000000
  %56 = tail call float @llvm.rint.f32(float %55)
  %57 = tail call float @llvm.fmuladd.f32(float %56, float 0xBFE62E4000000000, float %52)
  %58 = fadd float %54, %57
  %59 = fsub float %58, %57
  %60 = fsub float %54, %59
  %61 = fmul float %56, 0x3EB7F78000000000
  %62 = fsub float %58, %61
  %63 = fsub float %58, %62
  %64 = fsub float %63, %61
  %65 = fadd float %60, %64
  %66 = fadd float %62, %65
  %67 = fsub float %66, %62
  %68 = fsub float %65, %67
  %69 = fmul float %56, 0x3DD473DE60000000
  %70 = fsub float %66, %69
  %71 = fsub float %66, %70
  %72 = fsub float %71, %69
  %73 = fadd float %68, %72
  %74 = fadd float %70, %73
  %75 = fsub float %74, %70
  %76 = fsub float %73, %75
  %77 = tail call float @llvm.fmuladd.f32(float %74, float 0x3F56850E40000000, float 0x3F8123BCC0000000)
  %78 = tail call float @llvm.fmuladd.f32(float %74, float %77, float 0x3FA555B980000000)
  %79 = tail call float @llvm.fmuladd.f32(float %74, float %78, float 0x3FC55548E0000000)
  %80 = tail call float @llvm.fmuladd.f32(float %74, float %79, float 0x3FDFFFFF80000000)
  %81 = fmul float %74, %74
  %82 = fneg float %81
  %83 = tail call float @llvm.fma.f32(float %74, float %74, float %82)
  %84 = fmul float %76, 2.000000e+00
  %85 = tail call float @llvm.fma.f32(float %74, float %84, float %83)
  %86 = fadd float %81, %85
  %87 = fsub float %86, %81
  %88 = fsub float %85, %87
  %89 = fmul float %80, %86
  %90 = fneg float %89
  %91 = tail call float @llvm.fma.f32(float %86, float %80, float %90)
  %92 = tail call float @llvm.fma.f32(float %88, float %80, float %91)
  %93 = fadd float %89, %92
  %94 = fsub float %93, %89
  %95 = fsub float %92, %94
  %96 = fadd float %74, %93
  %97 = fsub float %96, %74
  %98 = fsub float %93, %97
  %99 = fadd float %76, %95
  %100 = fadd float %99, %98
  %101 = fadd float %96, %100
  %102 = fsub float %101, %96
  %103 = fsub float %100, %102
  %104 = fadd float %101, 1.000000e+00
  %105 = fadd float %104, -1.000000e+00
  %106 = fsub float %101, %105
  %107 = fadd float %103, %106
  %108 = fadd float %104, %107
  %109 = fsub float %108, %104
  %110 = fsub float %107, %109
  %111 = fptosi float %56 to i32
  %112 = tail call float @llvm.amdgcn.ldexp.f32(float %108, i32 %111)
  %113 = tail call float @llvm.amdgcn.ldexp.f32(float %110, i32 %111)
  %114 = tail call float @llvm.amdgcn.rcp.f32(float %112)
  %115 = fmul float %112, %114
  %116 = fneg float %115
  %117 = tail call float @llvm.fma.f32(float %114, float %112, float %116)
  %118 = tail call float @llvm.fma.f32(float %114, float %113, float %117)
  %119 = fadd float %115, %118
  %120 = fsub float %119, %115
  %121 = fsub float %118, %120
  %122 = fsub float 1.000000e+00, %119
  %123 = fsub float 1.000000e+00, %122
  %124 = fsub float %123, %119
  %125 = fsub float %124, %121
  %126 = fadd float %122, %125
  %127 = fmul float %114, %126
  %128 = fmul float %112, %127
  %129 = fneg float %128
  %130 = tail call float @llvm.fma.f32(float %127, float %112, float %129)
  %131 = tail call float @llvm.fma.f32(float %127, float %113, float %130)
  %132 = fsub float %126, %122
  %133 = fsub float %125, %132
  %134 = fadd float %128, %131
  %135 = fsub float %134, %128
  %136 = fsub float %131, %135
  %137 = fsub float %126, %134
  %138 = fsub float %126, %137
  %139 = fsub float %138, %134
  %140 = fadd float %133, %139
  %141 = fsub float %140, %136
  %142 = fadd float %137, %141
  %143 = fmul float %114, %142
  %144 = fadd float %114, %127
  %145 = fsub float %144, %114
  %146 = fsub float %127, %145
  %147 = fadd float %146, %143
  %148 = fadd float %144, %147
  %149 = fsub float %148, %144
  %150 = fsub float %147, %149
  %151 = tail call float @llvm.amdgcn.ldexp.f32(float %148, i32 -2)
  %152 = tail call float @llvm.amdgcn.ldexp.f32(float %150, i32 -2)
  %153 = fsub float %112, %151
  %154 = fsub float %112, %153
  %155 = fsub float %154, %151
  %156 = fadd float %113, %155
  %157 = fsub float %156, %152
  %158 = fadd float %153, %157
  %159 = fcmp ogt float %44, 0x40565A9F80000000
  %160 = select i1 %159, float 0x7FF0000000000000, float %158
  %161 = fcmp olt float %44, 0x3F30000000000000
  %162 = select i1 %161, float %44, float %160
  %163 = tail call float @llvm.copysign.f32(float %162, float %43)
  %164 = add nsw i32 %18, %7
  %165 = mul nsw i32 %26, %8
  %166 = add nsw i32 %164, %165
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %6, i64 %167
  store float %163, float addrspace(1)* %168, align 4, !tbaa !7
  br label %169

169:                                              ; preds = %9, %37, %30
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
