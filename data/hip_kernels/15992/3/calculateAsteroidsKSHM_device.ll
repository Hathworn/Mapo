; ModuleID = '../data/hip_kernels/15992/3/main.cu'
source_filename = "../data/hip_kernels/15992/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.asteroid = type { float, float, float, float }
%struct.blackHole = type { float, float, float }

@s = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22calculateAsteroidsKSHMP8asteroidiP9blackHoleifi(%struct.asteroid addrspace(1)* nocapture %0, i32 %1, %struct.blackHole addrspace(1)* nocapture readonly %2, i32 %3, float %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = udiv i32 %15, %12
  %20 = mul i32 %19, %12
  %21 = icmp ugt i32 %15, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %12
  %25 = icmp eq i32 %18, 0
  br i1 %25, label %26, label %62

26:                                               ; preds = %6
  %27 = bitcast %struct.blackHole addrspace(1)* %2 to i8 addrspace(1)*
  %28 = sext i32 %5 to i64
  %29 = icmp ugt i32 %5, 3
  br i1 %29, label %30, label %48

30:                                               ; preds = %26, %30
  %31 = phi i8 addrspace(1)* [ %45, %30 ], [ %27, %26 ]
  %32 = phi i8 addrspace(3)* [ %46, %30 ], [ bitcast ([0 x float] addrspace(3)* @s to i8 addrspace(3)*), %26 ]
  %33 = phi i64 [ %44, %30 ], [ %28, %26 ]
  %34 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !16
  store i8 %34, i8 addrspace(3)* %32, align 1, !tbaa !16
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 1
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !16
  %37 = getelementptr inbounds i8, i8 addrspace(3)* %32, i32 1
  store i8 %36, i8 addrspace(3)* %37, align 1, !tbaa !16
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 2
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !16
  %40 = getelementptr inbounds i8, i8 addrspace(3)* %32, i32 2
  store i8 %39, i8 addrspace(3)* %40, align 1, !tbaa !16
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 3
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !16
  %43 = getelementptr inbounds i8, i8 addrspace(3)* %32, i32 3
  store i8 %42, i8 addrspace(3)* %43, align 1, !tbaa !16
  %44 = add i64 %33, -4
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %31, i64 4
  %46 = getelementptr inbounds i8, i8 addrspace(3)* %32, i32 4
  %47 = icmp ugt i64 %44, 3
  br i1 %47, label %30, label %48, !llvm.loop !19

48:                                               ; preds = %30, %26
  %49 = phi i64 [ %28, %26 ], [ %44, %30 ]
  %50 = phi i8 addrspace(3)* [ bitcast ([0 x float] addrspace(3)* @s to i8 addrspace(3)*), %26 ], [ %46, %30 ]
  %51 = phi i8 addrspace(1)* [ %27, %26 ], [ %45, %30 ]
  switch i64 %49, label %62 [
    i64 3, label %52
    i64 2, label %56
    i64 1, label %60
  ]

52:                                               ; preds = %48
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %51, i64 2
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !16
  %55 = getelementptr inbounds i8, i8 addrspace(3)* %50, i32 2
  store i8 %54, i8 addrspace(3)* %55, align 1, !tbaa !16
  br label %56

56:                                               ; preds = %52, %48
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %51, i64 1
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !16
  %59 = getelementptr inbounds i8, i8 addrspace(3)* %50, i32 1
  store i8 %58, i8 addrspace(3)* %59, align 1, !tbaa !16
  br label %60

60:                                               ; preds = %56, %48
  %61 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !16
  store i8 %61, i8 addrspace(3)* %50, align 1, !tbaa !16
  br label %62

62:                                               ; preds = %60, %48, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp slt i32 %18, %1
  br i1 %63, label %64, label %73

64:                                               ; preds = %62
  %65 = icmp sgt i32 %3, 0
  br label %66

66:                                               ; preds = %64, %124
  %67 = phi i32 [ %18, %64 ], [ %175, %124 ]
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %68, i32 0
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !21
  %71 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %68, i32 1
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !24
  br i1 %65, label %74, label %124

73:                                               ; preds = %124, %62
  ret void

74:                                               ; preds = %66, %118
  %75 = phi float [ %120, %118 ], [ 0.000000e+00, %66 ]
  %76 = phi float [ %119, %118 ], [ 0.000000e+00, %66 ]
  %77 = phi i32 [ %121, %118 ], [ 0, %66 ]
  %78 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(3)* bitcast ([0 x float] addrspace(3)* @s to %struct.blackHole addrspace(3)*), i32 %77, i32 0
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !25
  %80 = fsub contract float %70, %79
  %81 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(3)* bitcast ([0 x float] addrspace(3)* @s to %struct.blackHole addrspace(3)*), i32 %77, i32 1
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !27
  %83 = fsub contract float %72, %82
  %84 = fcmp contract une float %80, 0.000000e+00
  %85 = fcmp contract une float %83, 0.000000e+00
  %86 = select i1 %84, i1 %85, i1 false
  br i1 %86, label %87, label %118

87:                                               ; preds = %74
  %88 = fmul contract float %80, %80
  %89 = fmul contract float %83, %83
  %90 = fadd contract float %88, %89
  %91 = fmul contract float %90, %90
  %92 = fcmp olt float %91, 0x39F0000000000000
  %93 = select i1 %92, float 0x41F0000000000000, float 1.000000e+00
  %94 = fmul float %91, %93
  %95 = tail call float @llvm.sqrt.f32(float %94)
  %96 = bitcast float %95 to i32
  %97 = add nsw i32 %96, -1
  %98 = bitcast i32 %97 to float
  %99 = add nsw i32 %96, 1
  %100 = bitcast i32 %99 to float
  %101 = tail call i1 @llvm.amdgcn.class.f32(float %94, i32 608)
  %102 = select i1 %92, float 0x3EF0000000000000, float 1.000000e+00
  %103 = fneg float %100
  %104 = tail call float @llvm.fma.f32(float %103, float %95, float %94)
  %105 = fcmp ogt float %104, 0.000000e+00
  %106 = fneg float %98
  %107 = tail call float @llvm.fma.f32(float %106, float %95, float %94)
  %108 = fcmp ole float %107, 0.000000e+00
  %109 = select i1 %108, float %98, float %95
  %110 = select i1 %105, float %100, float %109
  %111 = fmul float %102, %110
  %112 = select i1 %101, float %94, float %111
  %113 = fdiv contract float 1.000000e+00, %112
  %114 = fmul contract float %80, %113
  %115 = fadd contract float %75, %114
  %116 = fmul contract float %83, %113
  %117 = fadd contract float %76, %116
  br label %118

118:                                              ; preds = %74, %87
  %119 = phi float [ %117, %87 ], [ %76, %74 ]
  %120 = phi float [ %115, %87 ], [ %75, %74 ]
  %121 = add nuw nsw i32 %77, 1
  %122 = icmp slt i32 %121, %3
  %123 = select i1 %86, i1 %122, i1 false
  br i1 %123, label %74, label %124, !llvm.loop !28

124:                                              ; preds = %118, %66
  %125 = phi float [ 0.000000e+00, %66 ], [ %119, %118 ]
  %126 = phi float [ 0.000000e+00, %66 ], [ %120, %118 ]
  %127 = fmul contract float %126, %126
  %128 = fmul contract float %125, %125
  %129 = fadd contract float %128, %127
  %130 = fcmp olt float %129, 0x39F0000000000000
  %131 = select i1 %130, float 0x41F0000000000000, float 1.000000e+00
  %132 = fmul float %129, %131
  %133 = tail call float @llvm.sqrt.f32(float %132)
  %134 = bitcast float %133 to i32
  %135 = add nsw i32 %134, -1
  %136 = bitcast i32 %135 to float
  %137 = add nsw i32 %134, 1
  %138 = bitcast i32 %137 to float
  %139 = tail call i1 @llvm.amdgcn.class.f32(float %132, i32 608)
  %140 = select i1 %130, float 0x3EF0000000000000, float 1.000000e+00
  %141 = fneg float %138
  %142 = tail call float @llvm.fma.f32(float %141, float %133, float %132)
  %143 = fcmp ogt float %142, 0.000000e+00
  %144 = fneg float %136
  %145 = tail call float @llvm.fma.f32(float %144, float %133, float %132)
  %146 = fcmp ole float %145, 0.000000e+00
  %147 = select i1 %146, float %136, float %133
  %148 = select i1 %143, float %138, float %147
  %149 = fmul float %140, %148
  %150 = select i1 %139, float %132, float %149
  %151 = fneg contract float %126
  %152 = fdiv contract float %151, %150
  %153 = fmul contract float %152, %4
  %154 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %68, i32 2
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !29
  %156 = fadd contract float %155, %153
  store float %156, float addrspace(1)* %154, align 4, !tbaa !29
  %157 = fneg contract float %125
  %158 = fdiv contract float %157, %150
  %159 = fmul contract float %158, %4
  %160 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %68, i32 3
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !30
  %162 = fadd contract float %161, %159
  store float %162, float addrspace(1)* %160, align 4, !tbaa !30
  %163 = fpext float %156 to double
  %164 = fmul contract double %163, 1.000000e-02
  %165 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %68, i32 0
  %166 = fpext float %70 to double
  %167 = fadd contract double %164, %166
  %168 = fptrunc double %167 to float
  store float %168, float addrspace(1)* %165, align 4, !tbaa !21
  %169 = fpext float %162 to double
  %170 = fmul contract double %169, 1.000000e-02
  %171 = getelementptr inbounds %struct.asteroid, %struct.asteroid addrspace(1)* %0, i64 %68, i32 1
  %172 = fpext float %72 to double
  %173 = fadd contract double %170, %172
  %174 = fptrunc double %173 to float
  store float %174, float addrspace(1)* %171, align 4, !tbaa !24
  %175 = add nsw i32 %67, %24
  %176 = icmp slt i32 %175, %1
  br i1 %176, label %66, label %73, !llvm.loop !31
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = !{!22, !23, i64 0}
!22 = !{!"_ZTS8asteroid", !23, i64 0, !23, i64 4, !23, i64 8, !23, i64 12}
!23 = !{!"float", !17, i64 0}
!24 = !{!22, !23, i64 4}
!25 = !{!26, !23, i64 0}
!26 = !{!"_ZTS9blackHole", !23, i64 0, !23, i64 4, !23, i64 8}
!27 = !{!26, !23, i64 4}
!28 = distinct !{!28, !20}
!29 = !{!22, !23, i64 8}
!30 = !{!22, !23, i64 12}
!31 = distinct !{!31, !20}
