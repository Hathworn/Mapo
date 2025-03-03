; ModuleID = '../data/hip_kernels/9000/13/main.cu'
source_filename = "../data/hip_kernels/9000/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@thread_results = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24dev_get_potential_energyPffS_S_S_S_S_S_S_i(float addrspace(1)* nocapture writeonly %0, float %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = mul i32 %12, %17
  %22 = add i32 %21, %11
  %23 = icmp ult i32 %22, %9
  br i1 %23, label %24, label %114

24:                                               ; preds = %10
  %25 = udiv i32 %20, %17
  %26 = mul i32 %25, %17
  %27 = icmp ugt i32 %20, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %17
  br label %31

31:                                               ; preds = %24, %110
  %32 = phi float [ 0.000000e+00, %24 ], [ %111, %110 ]
  %33 = phi i32 [ %22, %24 ], [ %112, %110 ]
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %110, label %35

35:                                               ; preds = %31
  %36 = zext i32 %33 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16, !amdgpu.noclobber !6
  %39 = getelementptr inbounds float, float addrspace(1)* %6, i64 %36
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16, !amdgpu.noclobber !6
  %41 = getelementptr inbounds float, float addrspace(1)* %4, i64 %36
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !16, !amdgpu.noclobber !6
  %43 = getelementptr inbounds float, float addrspace(1)* %7, i64 %36
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !16, !amdgpu.noclobber !6
  %45 = getelementptr inbounds float, float addrspace(1)* %5, i64 %36
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !6
  %47 = getelementptr inbounds float, float addrspace(1)* %8, i64 %36
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !6
  %49 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16, !amdgpu.noclobber !6
  br label %51

51:                                               ; preds = %35, %51
  %52 = phi float [ %32, %35 ], [ %107, %51 ]
  %53 = phi i32 [ 0, %35 ], [ %108, %51 ]
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16, !amdgpu.noclobber !6
  %57 = fsub contract float %56, %38
  %58 = getelementptr inbounds float, float addrspace(1)* %6, i64 %54
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16, !amdgpu.noclobber !6
  %60 = fsub contract float %59, %40
  %61 = fadd contract float %57, %60
  %62 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16, !amdgpu.noclobber !6
  %64 = fsub contract float %63, %42
  %65 = getelementptr inbounds float, float addrspace(1)* %7, i64 %54
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16, !amdgpu.noclobber !6
  %67 = fsub contract float %66, %44
  %68 = fadd contract float %64, %67
  %69 = getelementptr inbounds float, float addrspace(1)* %5, i64 %54
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16, !amdgpu.noclobber !6
  %71 = fsub contract float %70, %46
  %72 = getelementptr inbounds float, float addrspace(1)* %8, i64 %54
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16, !amdgpu.noclobber !6
  %74 = fsub contract float %73, %48
  %75 = fadd contract float %71, %74
  %76 = fmul contract float %61, %61
  %77 = fmul contract float %68, %68
  %78 = fadd contract float %76, %77
  %79 = fmul contract float %75, %75
  %80 = fadd contract float %78, %79
  %81 = fadd contract float %80, %1
  %82 = fcmp olt float %81, 0x39F0000000000000
  %83 = select i1 %82, float 0x41F0000000000000, float 1.000000e+00
  %84 = fmul float %81, %83
  %85 = tail call float @llvm.sqrt.f32(float %84)
  %86 = bitcast float %85 to i32
  %87 = add nsw i32 %86, -1
  %88 = bitcast i32 %87 to float
  %89 = add nsw i32 %86, 1
  %90 = bitcast i32 %89 to float
  %91 = tail call i1 @llvm.amdgcn.class.f32(float %84, i32 608)
  %92 = select i1 %82, float 0x3EF0000000000000, float 1.000000e+00
  %93 = fneg float %90
  %94 = tail call float @llvm.fma.f32(float %93, float %85, float %84)
  %95 = fcmp ogt float %94, 0.000000e+00
  %96 = fneg float %88
  %97 = tail call float @llvm.fma.f32(float %96, float %85, float %84)
  %98 = fcmp ole float %97, 0.000000e+00
  %99 = select i1 %98, float %88, float %85
  %100 = select i1 %95, float %90, float %99
  %101 = fmul float %92, %100
  %102 = select i1 %91, float %84, float %101
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16, !amdgpu.noclobber !6
  %105 = fmul contract float %104, %50
  %106 = fdiv contract float %105, %102
  %107 = fsub contract float %52, %106
  %108 = add nuw i32 %53, 1
  %109 = icmp ult i32 %108, %33
  br i1 %109, label %51, label %110, !llvm.loop !20

110:                                              ; preds = %51, %31
  %111 = phi float [ %32, %31 ], [ %107, %51 ]
  %112 = add i32 %30, %33
  %113 = icmp ult i32 %112, %9
  br i1 %113, label %31, label %114, !llvm.loop !22

114:                                              ; preds = %110, %10
  %115 = phi float [ 0.000000e+00, %10 ], [ %111, %110 ]
  %116 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @thread_results, i32 0, i32 %11
  store float %115, float addrspace(3)* %116, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %117 = icmp ult i16 %16, 2
  br i1 %117, label %130, label %118

118:                                              ; preds = %114, %128
  %119 = phi i32 [ %120, %128 ], [ %17, %114 ]
  %120 = lshr i32 %119, 1
  %121 = icmp ult i32 %11, %120
  br i1 %121, label %122, label %128

122:                                              ; preds = %118
  %123 = add nuw nsw i32 %120, %11
  %124 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @thread_results, i32 0, i32 %123
  %125 = load float, float addrspace(3)* %124, align 4, !tbaa !16
  %126 = load float, float addrspace(3)* %116, align 4, !tbaa !16
  %127 = fadd contract float %125, %126
  store float %127, float addrspace(3)* %116, align 4, !tbaa !16
  br label %128

128:                                              ; preds = %122, %118
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = icmp ult i32 %119, 4
  br i1 %129, label %130, label %118, !llvm.loop !23

130:                                              ; preds = %128, %114
  %131 = icmp eq i32 %11, 0
  br i1 %131, label %132, label %136

132:                                              ; preds = %130
  %133 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @thread_results, i32 0, i32 0), align 4, !tbaa !16
  %134 = zext i32 %12 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  store float %133, float addrspace(1)* %135, align 4, !tbaa !16
  br label %136

136:                                              ; preds = %132, %130
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
