; ModuleID = '../data/hip_kernels/15928/0/main.cu'
source_filename = "../data/hip_kernels/15928/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14mc_kernel_callPffffffffS_jj(float addrspace(1)* nocapture writeonly %0, float %1, float %2, float %3, float %4, float %5, float %6, float %7, float addrspace(1)* nocapture readonly %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = icmp ult i32 %20, %10
  br i1 %21, label %22, label %163

22:                                               ; preds = %11
  %23 = tail call i32 @llvm.umax.i32(i32 %9, i32 1)
  %24 = add i32 %23, -1
  %25 = and i32 %23, 7
  %26 = icmp ult i32 %24, 7
  br i1 %26, label %115, label %27

27:                                               ; preds = %22
  %28 = and i32 %23, -8
  br label %29

29:                                               ; preds = %29, %27
  %30 = phi float [ %3, %27 ], [ %111, %29 ]
  %31 = phi i32 [ %20, %27 ], [ %112, %29 ]
  %32 = phi i32 [ 0, %27 ], [ %113, %29 ]
  %33 = fmul contract float %30, %5
  %34 = fmul contract float %33, %7
  %35 = fadd contract float %30, %34
  %36 = fmul contract float %30, %4
  %37 = sext i32 %31 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %8, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !6
  %40 = fmul contract float %36, %39
  %41 = fadd contract float %35, %40
  %42 = add nsw i32 %31, 1
  %43 = fmul contract float %41, %5
  %44 = fmul contract float %43, %7
  %45 = fadd contract float %41, %44
  %46 = fmul contract float %41, %4
  %47 = sext i32 %42 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %8, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = fmul contract float %46, %49
  %51 = fadd contract float %45, %50
  %52 = add nsw i32 %31, 2
  %53 = fmul contract float %51, %5
  %54 = fmul contract float %53, %7
  %55 = fadd contract float %51, %54
  %56 = fmul contract float %51, %4
  %57 = sext i32 %52 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %8, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = fmul contract float %56, %59
  %61 = fadd contract float %55, %60
  %62 = add nsw i32 %31, 3
  %63 = fmul contract float %61, %5
  %64 = fmul contract float %63, %7
  %65 = fadd contract float %61, %64
  %66 = fmul contract float %61, %4
  %67 = sext i32 %62 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %8, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = fmul contract float %66, %69
  %71 = fadd contract float %65, %70
  %72 = add nsw i32 %31, 4
  %73 = fmul contract float %71, %5
  %74 = fmul contract float %73, %7
  %75 = fadd contract float %71, %74
  %76 = fmul contract float %71, %4
  %77 = sext i32 %72 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %8, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !6
  %80 = fmul contract float %76, %79
  %81 = fadd contract float %75, %80
  %82 = add nsw i32 %31, 5
  %83 = fmul contract float %81, %5
  %84 = fmul contract float %83, %7
  %85 = fadd contract float %81, %84
  %86 = fmul contract float %81, %4
  %87 = sext i32 %82 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %8, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !6
  %90 = fmul contract float %86, %89
  %91 = fadd contract float %85, %90
  %92 = add nsw i32 %31, 6
  %93 = fmul contract float %91, %5
  %94 = fmul contract float %93, %7
  %95 = fadd contract float %91, %94
  %96 = fmul contract float %91, %4
  %97 = sext i32 %92 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %8, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !6
  %100 = fmul contract float %96, %99
  %101 = fadd contract float %95, %100
  %102 = add nsw i32 %31, 7
  %103 = fmul contract float %101, %5
  %104 = fmul contract float %103, %7
  %105 = fadd contract float %101, %104
  %106 = fmul contract float %101, %4
  %107 = sext i32 %102 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %8, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = fmul contract float %106, %109
  %111 = fadd contract float %105, %110
  %112 = add nsw i32 %31, 8
  %113 = add i32 %32, 8
  %114 = icmp eq i32 %113, %28
  br i1 %114, label %115, label %29, !llvm.loop !11

115:                                              ; preds = %29, %22
  %116 = phi float [ undef, %22 ], [ %111, %29 ]
  %117 = phi float [ %3, %22 ], [ %111, %29 ]
  %118 = phi i32 [ %20, %22 ], [ %112, %29 ]
  %119 = icmp eq i32 %25, 0
  br i1 %119, label %136, label %120

120:                                              ; preds = %115, %120
  %121 = phi float [ %132, %120 ], [ %117, %115 ]
  %122 = phi i32 [ %133, %120 ], [ %118, %115 ]
  %123 = phi i32 [ %134, %120 ], [ 0, %115 ]
  %124 = fmul contract float %121, %5
  %125 = fmul contract float %124, %7
  %126 = fadd contract float %121, %125
  %127 = fmul contract float %121, %4
  %128 = sext i32 %122 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %8, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !6
  %131 = fmul contract float %127, %130
  %132 = fadd contract float %126, %131
  %133 = add nsw i32 %122, 1
  %134 = add i32 %123, 1
  %135 = icmp eq i32 %134, %25
  br i1 %135, label %136, label %120, !llvm.loop !13

136:                                              ; preds = %120, %115
  %137 = phi float [ %116, %115 ], [ %132, %120 ]
  %138 = fcmp contract ogt float %137, %2
  %139 = fsub contract float %137, %2
  %140 = fpext float %139 to double
  %141 = select contract i1 %138, double %140, double 0.000000e+00
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %142 = fneg contract float %6
  %143 = fmul contract float %142, %1
  %144 = fmul float %143, 0x3FF7154760000000
  %145 = tail call float @llvm.rint.f32(float %144)
  %146 = fcmp ogt float %143, 0x40562E4300000000
  %147 = fcmp olt float %143, 0xC059D1DA00000000
  %148 = fneg float %144
  %149 = tail call float @llvm.fma.f32(float %143, float 0x3FF7154760000000, float %148)
  %150 = tail call float @llvm.fma.f32(float %143, float 0x3E54AE0BE0000000, float %149)
  %151 = fsub float %144, %145
  %152 = fadd float %150, %151
  %153 = tail call float @llvm.exp2.f32(float %152)
  %154 = fptosi float %145 to i32
  %155 = tail call float @llvm.amdgcn.ldexp.f32(float %153, i32 %154)
  %156 = select i1 %147, float 0.000000e+00, float %155
  %157 = select i1 %146, float 0x7FF0000000000000, float %156
  %158 = fpext float %157 to double
  %159 = fmul contract double %141, %158
  %160 = fptrunc double %159 to float
  %161 = sext i32 %20 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  store float %160, float addrspace(1)* %162, align 4, !tbaa !7
  br label %163

163:                                              ; preds = %136, %11
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
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
